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

  final String titleText = 'Expenses calculator';
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
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.green,
                        width: 2,
                      )),
                      child: Text(
                        tx.amount.toString(),
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
                          tx.title,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(tx.date.toString(),
                        style: TextStyle(color: Colors.orange),),
                      ],
                    ),
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
