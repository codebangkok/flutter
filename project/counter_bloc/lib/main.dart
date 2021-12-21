import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
