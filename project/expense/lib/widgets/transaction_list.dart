import 'package:expense/models/transaction.dart';
import 'package:expense/widgets/transaction_cell.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) => TransactionCell(transactions[index]),
        itemCount: transactions.length,
      ),
    );
  }
}
