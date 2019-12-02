import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    //extract data
    final enteredData = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredData.isEmpty || enteredAmount <0){
      return;
    }
    widget.addTx(
      enteredData,
      enteredAmount,
    );
    Navigator.of(context).pop();  //after adding transaction close bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (value){
              //   titleInput = value;
              // },
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              //keyboardType: TextInputType.numberWithOptions(signed: true,),
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitData(),
              // onChanged: (value){
              //   amountInput = value;
              // },
            ),
            FlatButton(
              textColor: Colors.green,
              child: Text('Add Transaction'),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
