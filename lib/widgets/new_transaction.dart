import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './adaptive_buttons.dart';

class NewTransaction extends StatefulWidget {
   NewTransaction(this.addTx){
    print('Constructor NewTransaction Widget');
  }
  final Function addTx;

  @override
  _NewTransactionState createState() {
    print('CreateState NewTransaction Widget');
    return _NewTransactionState();}
}

class _NewTransactionState extends State<NewTransaction>  {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate;
  bool _validateInput = false;

   _NewTransactionState () {
     print('CreateState NewTransaction State');
   }

   @override
  void initState() {
    //for initial data
    super.initState();
    print('initState NewTransaction ');
    
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    //refetch data from parent
    print('didUpdateWidget  ');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    //cleaning up data, can gave you some memory leak, or fight with them
    print('dispose  ');
    super.dispose();
  }


  void _submitData() {
    if (_amountController.text.isEmpty || _titleController.text.isEmpty) {
      _validateInput = true;
    } else {
      _validateInput = false;
    }
    //extract data
    final String enteredData = _titleController.text;
    final double enteredAmount = double.parse(_amountController.text);
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
    ).then((DateTime pickDate) {
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
                    errorText:
                        _validateInput ? 'Amount can\'t be empty' : null),
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
                    AdaptiveButtons(
                      textInButton: 'Choose date',
                      handler: _presentDatePicker,
                    ),
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
