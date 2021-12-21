import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_new/bloc/common_bloc.dart';
import 'package:flutter_bloc_new/model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ProductBloc extends Bloc<MyEvent, MyState> {
  ProductBloc() : super(StateInitialized()) {
    on<GetProductsEvent>(_onGetProducts);
  }

  void _onGetProducts(GetProductsEvent event, Emitter<MyState> emit) async {
    emit(StateLoading());

    final res = await http.get(
      Uri.parse('http://codebangkok.com:3000/products'),
    );

    if (res.statusCode != HttpStatus.ok) {
      emit(StateError(message: res.body));
      return;
    }

    final json = jsonDecode(utf8.decode(res.bodyBytes)) as List;
    final products = json.map((e) => Product.fromJson(e)).toList();

    emit(GetProductsStateSuccess(products: products));
  }
}

class GetProductsEvent extends MyEvent {}

class GetProductsStateSuccess extends MyState {
  List<Product> products;
  GetProductsStateSuccess({required this.products});
}
