import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:africa/models/auth_user.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import 'common.dart';

class AuthenBloc extends Bloc<MyEvent, MyState> {
  AuthenBloc() : super(StateUnInitialized());

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    if (event is AuthenLoginEvent) {
      yield StateLoading(title: '');

      final response = await http.post(
        Uri.parse('https://techcoach.azurewebsites.net/registration/login'),
        headers: {'content-type': 'application/json'},
        body: jsonEncode(event.toMap()),
      );

      if (response.statusCode != HttpStatus.ok) {
        yield StateError(message: response.statusCode.toString());
        return;
      }

      final json = jsonDecode(response.body);
      final authUser = AuthUser.fromJson(json);
      yield AuthenLoginStateSuccess(authUser: authUser);
    }
  }
}

class AuthenLoginEvent extends MyEvent {
  final String email;
  final String password;
  AuthenLoginEvent({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        'email': email,
        'password': password,
      };
}

class AuthenLoginStateSuccess extends MyState {
  final AuthUser authUser;
  AuthenLoginStateSuccess({required this.authUser});
}
