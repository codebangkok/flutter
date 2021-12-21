import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import '../models/gender.dart';
import 'common.dart';

class GenderGetEvent extends Event {
  @override
  String toString() => 'GenderGetEvent';
}

class GenderGetStateSuccess extends State {
  final List<Gender> genders;
  GenderGetStateSuccess({required this.genders});

  @override
  String toString() => genders.toString();
}

class GenderBloc extends Bloc<Event, State> {
  GenderBloc() : super(StateUnInitialized());

  @override
  Stream<State> mapEventToState(Event event) async* {
    if (event is GenderGetEvent) {
      yield StateLoading(title: event.toString());

      final response = await http.get(
        Uri.parse('https://techcoach.azurewebsites.net/registration/genders'),
      );

      if (response.statusCode != HttpStatus.ok) {
        yield StateError(message: response.statusCode.toString());
        return;
      }

      final json = jsonDecode(response.body) as List;
      final genders = json.map((e) => Gender.fromJson(e)).toList();
      yield GenderGetStateSuccess(genders: genders);
    }
  }
}
