import 'package:expense/models/transaction.dart';
import 'package:expense/widgets/transaction_list.dart';
import 'package:expense/widgets/transaction_new.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Weekly Groceries', amount: 16.53, date: DateTime.now()),
  ];

  void addTransaction({@required String title, @required double amount}) {
    setState(() {
      transactions.add(Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Expense App')),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text('CHART'),
                TransactionNew(addTransaction),
                TransactionList(transactions),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
