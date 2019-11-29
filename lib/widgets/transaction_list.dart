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
      child: ListView.builder(
        itemBuilder: (contex, index){
return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.green,
              width: 2,
            )),
            child: Text(
              '\$: ${transaction[index].amount}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.blue),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                transaction[index].title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.yMMMMd().format(transaction[index].date),
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ],
      ),
            );
        },
        itemCount: transaction.length,
          //transform our list of Transactions to a list of cards where each card
          //outputs the title of the transaction(tx)
          children: transaction.map((tx) {
            
          }).toList(),
        ),
    );
  }
}
