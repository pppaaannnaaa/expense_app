import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _removeTransaction;
  TransactionList(this._userTransactions, this._removeTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: _userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/waiting.png',
                  height: 200,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 8,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                              '\u{20B9} ${_userTransactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      _userTransactions[index].title.toString(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    subtitle: Text(
                      DateFormat('dd MMMM yyyy')
                          .format(_userTransactions[index].date),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () =>
                          _removeTransaction(_userTransactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
