import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/screens/home_screen.dart';
import 'package:counter_bloc/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  final _counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
    // return MaterialApp(
    //   // home: BlocProvider(
    //   //   create: (context) => CounterBloc(),
    //   //   child: HomeScreen(),
    //   // ),
    //   routes: {
    //     //'/': (context) => BlocProvider.value(value: _counterBloc, child: HomeScreen()),
    //     //'/second': (context) => BlocProvider.value(value: _counterBloc, child: SecondScreen()),
    //     '/': (context) => MultiBlocProvider(providers: [BlocProvider.value(value: _counterBloc)], child: HomeScreen()),
    //     '/second': (context) => MultiBlocProvider(providers: [BlocProvider.value(value: _counterBloc)], child: SecondScreen()),
    //   },
    // );
  }
}
