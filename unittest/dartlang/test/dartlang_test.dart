import 'package:dartlang/dartlang.dart';
import 'package:test/test.dart';

void main() {
  test('hello', () {
    expect(hello('World'), 'Hello World');
    expect(hello('Infinitas'), 'Hello Infinitas');
  });

  test('addition', () {
    expect(addition(3, 2), 5);
    expect(addition(-3, -6), -9);
    expect(addition(7, 3), 10);
  });

  test('reverse', () {
    expect(reverse(true), false);
    expect(reverse(false), true);
  });

  test('inchesToFeet', () {
    expect(inchesToFeet(324), 27);
    expect(inchesToFeet(12), 1);
    expect(inchesToFeet(36), 3);
  });

  test('makePair', () {
    expect(makePair(1, 2), [1, 2]);
    expect(makePair(51, 21), [51, 21]);
    expect(makePair(512124, 215), [512124, 215]);
  });

  test('remainer', () {
    expect(remainer(7, 2), 1);
    expect(remainer(12, 4), 0);
    expect(remainer(-9, 45), 36);
    expect(remainer(5, 5), 0);
  });

  test('triangleArea', () {
    expect(triangleArea(3, 2), 3);
    expect(triangleArea(7, 4), 14);
    expect(triangleArea(10, 10), 50);
  });

  test('lessThanOrEqualToZero', () {
    expect(lessThanOrEqualToZero(5), false);
    expect(lessThanOrEqualToZero(0), true);
    expect(lessThanOrEqualToZero(-2), true);
  });

  test('dividesEvenly', () {
    expect(dividesEvenly(98, 7), true);
    expect(dividesEvenly(85, 4), false);
  });

  test('isSameNum', () {
    expect(isSameNum(4, 8), false);
    expect(isSameNum(2, 2), true);
    expect(isSameNum(2, 3), false);
  });

  test('nextNumber', () {
    expect(nextNumber(0), 1);
    expect(nextNumber(9), 10);
    expect(nextNumber(-3), -2);
  });

  test('concatName', () {
    expect(concatName('First', 'Last'), 'Last, First');
    expect(concatName('John', 'Doe'), 'Doe, John');
    expect(concatName('Mary', 'Jane'), 'Jane, Mary');
  });

  test('lessThan100', () {
    expect(lessThan100(22, 15), true);
    expect(lessThan100(83, 34), false);
    expect(lessThan100(3, 77), true);
  });

  test('compareCountChar', () {
    expect(compareCountChar('AB', 'CD'), true);
    expect(compareCountChar('ABC', 'DE'), false);
    expect(compareCountChar('dart', 'flutter'), false);
  });

  test('checkGivenNumber', () {
    expect(checkGivenNumber([1, 2, 3, 4, 5], 3), true);
    expect(checkGivenNumber([1, 1, 2, 1, 1], 3), false);
    expect(checkGivenNumber([5, 5, 5, 6], 5), true);
    expect(checkGivenNumber([], 5), false);
  });

  test('findLargestNum', () {
    expect(findLargestNum([4, 5, 1, 3]), 5);
    expect(findLargestNum([300, 200, 600, 150]), 600);
    expect(findLargestNum([1000, 1001, 857, 1]), 1001);
  });

  test('isEvenOrOdd', () {
    expect(isEvenOrOdd(3), 'odd');
    expect(isEvenOrOdd(146), 'even');
    expect(isEvenOrOdd(-5), 'odd');
  });

  test('isEvenCharCount', () {
    expect(isEvenCharCount('apples'), true);
    expect(isEvenCharCount('pears'), false);
    expect(isEvenCharCount('cherry'), true);
  });

  test('noOdds', () {
    expect(noOdds([1, 2, 3, 4, 5, 6, 7, 8]), [2, 4, 6, 8]);
    expect(noOdds([43, 65, 23, 89, 53, 9, 6]), [6]);
    expect(noOdds([718, 991, 449, 644, 380, 440]), [718, 644, 380, 440]);
  });

  test('sameCase', () {
    expect(sameCase('hello'), true);
    expect(sameCase('HELLO'), true);
    expect(sameCase('Hello'), false);
    expect(sameCase('ketcHUp'), false);
  });

  test('hashPlusCount', () {
    expect(hashPlusCount('###+'), [3, 1]);
    expect(hashPlusCount('##+++#'), [3, 3]);
    expect(hashPlusCount('#+++#+#++#'), [4, 6]);
    expect(hashPlusCount(''), [0, 0]);
  });
}
