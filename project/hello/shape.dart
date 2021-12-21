import 'dart:html';
import 'dart:math';

abstract class Shape {
  double get area;
}

class Square extends Shape {
  double side;
  Square(this.side);

  @override
  double get area => side * side;
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double get area => pi * radius * radius;
}

void printArea(Shape shape) {
  print(shape.area);
}

void main() {
  final s = Square(10);
  printArea(s);

  final c = Circle(10);
  printArea(c);

  final shapes = [Square(10), Circle(10)];
  shapes.forEach(printArea);
}
