/// Hello World
String hello(String name) {
  return 'Hello $name';
}

/// Return the Sum of Two Numbers
int addition(int a, int b) {
  return a + b;
}

/// Flip the Boolean
bool reverse(bool flip) {
  return !flip;
}

/// Inches to Feet
double inchesToFeet(double inches) {
  return inches / 12.0;
}

/// Pair Management
List<int> makePair(int num1, int num2) {
  return [num1, num2];
}

/// Return the Remainder from Two Numbers
int remainer(int x, int y) {
  return x % y;
}

/// Area of a Triangle
double triangleArea(int base, int height) {
  return (base * height) / 2.0;
}

/// Is the Number Less than or Equal to Zero?
bool lessThanOrEqualToZero(double num) {
  return num <= 0;
}

/// Divides Evenly
bool dividesEvenly(int a, int b) {
  return a % b == 0;
}

/// Are the Numbers Equal?
bool isSameNum(int num1, int num2) {
  return num1 == num2;
}

/// Return the Next Number
int nextNumber(int num) {
  return num + 1;
}

/// Concatenate First and Last Name in the format "Last, First"
String concatName(String firstName, String lastName) {
  return '$lastName, $firstName';
}

/// The Sum of both numbers is less than 100?
bool lessThan100(int a, int b) {
  return (a + b) < 100;
}

/// Compare Strings by Count of Characters
bool compareCountChar(String str1, String str2) {
  return str1.length == str2.length;
}

/// Check if and array Contains a Given Number
bool checkGivenNumber(List<int> list, int num) {
  return list.contains(num);
}

/// Find the Largest Number in an Array
int findLargestNum(List<int> list) {
  var max = list[0];
  for (var num in list) {
    if (num > max) max = num;
  }
  return max;
}

/// Is the Number Even or Odd?
String isEvenOrOdd(int num) {
  return num % 2 == 0 ? 'even' : 'odd';
}

/// Is Even the Charactor in String
bool isEvenCharCount(String s) {
  return s.length % 2 == 0;
}

/// Eliminate Odd Numbers within an Array
List<int> noOdds(List<int> list) {
  return list.where((element) => element % 2 == 0).toList();
}

/// Check if the Same Case
bool sameCase(String str) {
  return str.toUpperCase() == str || str.toLowerCase() == str;
}

/// Hashes and Pluses Count
List<int> hashPlusCount(String str) {
  var hash = str.split('#');
  var plus = str.split('+');
  return [hash.length - 1, plus.length - 1];
}
