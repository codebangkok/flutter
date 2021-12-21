import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCell extends StatelessWidget {
  final Transaction tx;

  const TransactionCell(this.tx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              '\$${tx.amount}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tx.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('dd MMMM yyyy HH:mm').format(tx.date),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
