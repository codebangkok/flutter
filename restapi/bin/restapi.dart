import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  //getGender();
  //
  //login();
  getAnimals();
  //

  // final body = '{"id":1,"name":"ชาย"}';
  // final json = jsonDecode(body);
  // final male = Gender.fromJson(json);
  // print(male.name);
  //

  // final body = '[{"id":1,"name":"ชาย"},{"id":2,"name":"หญิง"}]';
  // final jsons = jsonDecode(body) as List;
  // final genders = jsons.map((e) => Gender.fromJson(e)).toList();
  // for (var g in genders) {
  //   print(g.name);
  // }
}

void getAnimals() async {
  final jwtToken = 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjMiLCJzdWIiOiJib25kIiwiZW1haWwiOiJib25kIiwibmJmIjoxNjE5NjAxOTg5LCJleHAiOjE2MTk2MjM1ODksImlhdCI6MTYxOTYwMTk4OX0.4ar-ZPC_zqw_3MKE-CNgSHiSKDfNRfzvgXBi3IuhZ0WFyuj2rmDCRvihvgs8qckqvgKK970lIDtGF0T8a7lm-A';
  final response = await http.get(
    Uri.parse('https://techcoach.azurewebsites.net/africa/animals'),
    headers: {'Authorization': 'Bearer $jwtToken'},
  );

  if (response.statusCode != 200) {
    print(response.statusCode);
    return;
  }

  print(response.body);
}

void getGender() async {
  final response = await http.get(Uri.parse('https://techcoach.azurewebsites.net/registration/genders'));

  if (response.statusCode != 200) {
    print(response.statusCode);
    return;
  }

  final jsons = jsonDecode(response.body) as List;
  final genders = jsons.map((e) => Gender.fromJson(e)).toList();
  for (var g in genders) {
    print(g.name);
  }
}

void login() async {
  final response = await http.post(
    Uri.parse('https://techcoach.azurewebsites.net/registration/login'),
    headers: {'content-type': 'application/json'},
    body: jsonEncode({
      'email': 'bond',
      'password': '123',
    }),
  );

  if (response.statusCode != 200) {
    print(response.statusCode);
    return;
  }

  final json = jsonDecode(response.body);
  final authUser = AuthUser.fromJson(json);
  print(authUser.firstName);
  print(authUser.gender.name);
  print(authUser.jwtToken);
}

class Gender {
  int id;
  String name;
  Gender({required this.id, required this.name});

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json['id'],
        name: json['name'],
      );
}

class AuthUser {
  int id;
  String firstName;
  String lastName;
  String email;
  Gender gender;
  String jwtToken;
  AuthUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.jwtToken,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        gender: Gender.fromJson(json['gender']),
        jwtToken: json['jwtToken'],
      );
}
