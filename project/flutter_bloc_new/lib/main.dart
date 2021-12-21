// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_new/bloc/product_bloc.dart';
import 'package:flutter_bloc_new/screen/product_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop',
        home: ProductListScreen(),
      ),
    );
  }
}
