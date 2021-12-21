import 'dart:convert';

class Gender {
  final int id;
  final String name;
  Gender({
    required this.id,
    required this.name,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  @override
  String toString() => jsonEncode(toMap());
}
