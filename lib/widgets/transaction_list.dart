import 'package:expenses_calc/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
//recive List<Transaction> from user_transaction.dart
  const TransactionList(this.transaction, this.deleteTx);
  final List<Trasaction> transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(
            builder: (BuildContext ctx, BoxConstraints constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView(
            children: transaction
                .map((Trasaction tx) =>
                //Value key save current state using id, he didnt rebuild with rebuilding ListView, he is bro
                    TransactionItem(key:ValueKey(tx.id), transaction: tx, deleteTx: deleteTx))
                .toList(),
          );
  }
}
