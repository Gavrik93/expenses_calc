import './transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Trasaction> transactions = [
    Trasaction(
      id: 't1',
      title: 'New shoes',
      amount: 8.99,
      date: DateTime.now(),
    ),
    Trasaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 28.99,
      date: DateTime.now(),
    ),
  ];

  final String titleText = 'Flutter App';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            // alignment: Alignment.center,
            child: Card(
              color: Colors.orange,
              child: Text(
                'Chart!ssas',
              ),
              elevation: 15,
            ),
          ),
          Column(
            //transform our list of Transactions to a list of cards where each card
            //outputs the title of the transaction(tx)
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(tx.amount.toString()),
                    ),
                    Column(children: <Widget>[
                      Text(tx.title),
                      Text(tx.date.toString()),

                    ],),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
