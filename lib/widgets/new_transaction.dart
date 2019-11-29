import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

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
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (value){
              //   titleInput = value;
              // },
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(
                signed: true,
              ),
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (value){
              //   amountInput = value;
              // },
            ),
            FlatButton(
              textColor: Colors.green,
              child: Text('Add Transaction'),
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
