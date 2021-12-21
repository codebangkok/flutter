import 'dart:convert';
import 'dart:io';

import 'package:africa/bloc/common.dart';
import 'package:africa/models/animal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AnimalBloc extends Bloc<MyEvent, MyState> {
  AnimalBloc() : super(StateUnInitialized());

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    if (event is AnimalGetEvent) {
      yield StateLoading(title: '');

      final response = await http.get(
        Uri.parse('https://techcoach.azurewebsites.net/africa/animals'),
        headers: {'Authorization': 'Bearer ${event.jwtToken}'},
      );

      if (response.statusCode != HttpStatus.ok) {
        yield StateError(message: response.statusCode.toString());
        return;
      }

      final json = jsonDecode(response.body) as List;
      final animals = json.map((e) => Animal.fromJson(e)).toList();
      yield AnimalGetStateSuccess(animals: animals);
    }
  }
}

class AnimalGetEvent extends MyEvent {
  final String jwtToken;
  AnimalGetEvent({required this.jwtToken});
}

class AnimalGetStateSuccess extends MyState {
  final List<Animal> animals;
  AnimalGetStateSuccess({required this.animals});
}
