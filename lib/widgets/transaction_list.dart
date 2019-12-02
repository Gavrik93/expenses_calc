import 'package:intl/intl.dart';

import '../model/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
//recive List<Transaction> from user_transaction.dart
  TransactionList(this.transaction);
  final List<Trasaction> transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transaction.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 20,),
                Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)),
              ],
            )
          : ListView.builder(
              itemBuilder: (contex, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                        child: Text(
                          '\$: ${transaction[index].amount.toStringAsFixed(2)}', //how much numbers after dot
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transaction[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat.yMMMEd().format(transaction[index].date),
                            style: TextStyle(
                                color: Theme.of(context).primaryColorDark),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
