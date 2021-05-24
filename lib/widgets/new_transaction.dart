import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransaction;
  NewTransaction(this._addNewTransaction);
  NewTransactionState createState() => NewTransactionState();
}

class NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    var title = titleController.text;
    var amount = double.parse(amountController.text);
    if (title != '' && amount > 0 && _selectedDate != null) {
      widget._addNewTransaction(title, amount, _selectedDate);
    }
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 60,
              child: Row(children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No Date Choosen'
                        : DateFormat('dd MMMM yyyy').format(_selectedDate),
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  child: Text('Choose Date'),
                  onPressed: _showDatePicker,
                )
              ]),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text(
                'ADD Transaction',
                style: TextStyle(color: Theme.of(context).buttonColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
