import 'package:africa/models/gender.dart';

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
