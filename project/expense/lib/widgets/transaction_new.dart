import 'package:flutter/material.dart';

class TransactionNew extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final void Function({@required String title, @required double amount}) addTransaction;

  TransactionNew(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          TextButton(
            onPressed: () => addTransaction(title: titleController.text, amount: double.parse(amountController.text)),
            child: Text(
              'Add Transaction',
              style: TextStyle(color: Colors.purple),
            ),
          )
        ],
      ),
    );
  }
}
