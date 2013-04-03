import 'dart:html';
import 'dart:collection';
import 'dart:math';
import 'package:unittest/unittest.dart';


void main() {
    List<double> nums = new List();
    nums.add(4.0);
    nums.add(5.0);
    nums.add(6.0);
    nums.add(7.0);
    test('Sum', () => expect(sum(nums), equals(22.0)));
    test('Mean', () => expect(mean(nums), equals(5.5)));
    test('Median', () => expect(median(nums), equals(5.0)));
    test('Range', () => expect(range(nums), equals(3.0)));
    test('Max', () => expect(max(nums), equals(7.0)));
    test('Min', () => expect(min(nums), equals(4.0)));
}

num mean(List<num> elements) {
  assert(elements.length > 0);
  return (sum(elements) / elements.length);
}

num sum(List<num> elements) {
  return (elements.reduce(0, (prev, element) => prev + element));
}

num median(List<num> elements) {
  return ((order(elements)).elementAt(elements.length ~/ 2));
}

List<num> order(List<num> elements) {
  elements.sort((a,b) => b.compareTo(a));
  return new List.from(elements);
}

num min(List<num> elements) {
  return elements.reduce(double.NAN,  (prev, element) => prev < element);
}

num max(List<num> elements) {
  return elements.reduce(double.NAN, (prev, element) => prev >element);
}

num range(List<num> elements) {
  return (max(elements) - min(elements));
}

Map<num, int> histogram(List<num> elements) {
  Map<num, int> map = new Map<num, int>();
  var iterator = elements.iterator;
  while(iterator.moveNext()) {
    map[iterator.current] = map[iterator.current] + 1; 
  }
  return map;
}