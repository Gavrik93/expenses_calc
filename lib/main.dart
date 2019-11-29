import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';



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
  final String titleText = 'Expenses calculator';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
