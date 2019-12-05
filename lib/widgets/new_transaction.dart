import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;
  bool _validateInput = false;

  void _submitData() {
    if (_amountController.text.isEmpty || _titleController.text.isEmpty) {
      _validateInput = true;
    } else {
      _validateInput = false;
    }
    //extract data
    final enteredData = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredData.isEmpty || enteredAmount < 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enteredData,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop(); //after adding transaction close bottom sheet
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickDate) {
      if (pickDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Card(
        elevation: 15,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: 'Title',
                    errorText: _validateInput ? 'Title can\'t be empty' : null),

                onSubmitted: (_) => _submitData(),
                // onChanged: (value){
                //   titleInput = value;
                // },
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                //keyboardType: TextInputType.numberWithOptions(signed: true,),
                decoration: InputDecoration(
                    labelText: 'Amount',
                    errorText: _validateInput ? 'Amount can\'t be empty' : null),
                controller: _amountController,
                onSubmitted: (_) => _submitData(),
                // onChanged: (value){
                //   amountInput = value;
                // },
              ),
              Container(
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(_selectedDate == null
                        ? 'No date chosen'
                        : 'Picked date: ${DateFormat.yMMMMd().format(_selectedDate)}'),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Choose data',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _presentDatePicker,
                    )
                  ],
                ),
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                child: Text('Add Transaction'),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
