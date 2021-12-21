import 'temperature.dart';

void main() {
  final c = Temperature.celsius(100);

  // var result = cal(10, 20, (a, b) => a + b);
  // print(result);

  // var x = [1, 2, 3, 4];
  // var y = x.map((e) => e * 2);
  // print(y);

  // hello(name: 'Bond', age: 18);
}

// int add(int a, int b) => a + b;
// int sub(int a, int b) => a - b;
typedef MathFunc = int Function(int, int);
//int cal(int a, int b, int Function(int, int) func) => func(a, b);
int cal(int a, int b, MathFunc func) => func(a, b);

String hello({required String name, required int age}) {
  return 'My name is $name age $age';
}
