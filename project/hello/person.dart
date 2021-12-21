class Person {
  String name;
  int age;

  Person({this.name = '', this.age = 0});

  Person.bond()
      : this.name = 'Bond',
        age = 18;
}

class Customer extends Person {
  double salary = 0.0;
}

void main() {
  // final x = Person('Bond', 18);
  final x = Person(name: 'Bond', age: 18);

  print(x.name);

  final y = Person.bond();
  print(y.name);

  final a = Customer();
}
