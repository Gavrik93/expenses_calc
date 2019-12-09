import 'package:intl/intl.dart';

import '../model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
//recive List<Transaction> from user_transaction.dart
 const TransactionList(this.transaction, this.deleteTx);
  final List<Trasaction> transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constraints) {
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
        : ListView.builder(
            itemBuilder: (BuildContext contex, int index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('\$${transaction[index].amount}')),
                    ),
                  ),
                  title: Text(transaction[index].title,
                      style: Theme.of(context).textTheme.title),
                  subtitle: Text(
                    DateFormat.yMMMd().format(
                      transaction[index].date,
                    ),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          icon: Icon(Icons.delete),
                          label:const Text('Delete'),
                          textColor: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transaction[index].id),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.delete_forever,
                          ),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transaction[index].id),
                        ),
                ),
              );
            },
            itemCount: transaction.length,
          );
  }
}
