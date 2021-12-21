class Gender {
  int id;
  String name;
  Gender({required this.id, required this.name});

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json['id'],
        name: json['name'],
      );
}
