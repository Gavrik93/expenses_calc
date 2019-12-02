import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  void submitData() {
    //extract data
    final enteredData = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredData.isEmpty || enteredAmount <0){
      return;
    }
    addTx(
      titleController.text,
      double.parse(amountController.text),
    );
  }

  NewTransaction(this.addTx);
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
