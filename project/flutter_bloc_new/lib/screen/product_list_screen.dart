// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_new/bloc/common_bloc.dart';
import 'package:flutter_bloc_new/bloc/product_bloc.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ProductBloc>().add(GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ร้านค้า'),
      ),
      body: BlocConsumer<ProductBloc, MyState>(
        builder: (context, state) {
          if (state is StateLoading) {
            return Text(state.toString());
          } else if (state is GetProductsStateSuccess) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(state.products[i].name),
                subtitle: Text('ราคาสินค้า ${state.products[i].price} บาท'),
                leading: Image.network('http://codebangkok.com:3000/${state.products[i].image}'),
              ),
            );
          }

          return Container();
        },
        listener: (context, state) {
          if (state is StateError) {
            print(state);
          }
        },
      ),
    );
  }
}
