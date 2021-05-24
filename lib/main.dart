import 'package:flutter/material.dart';
import 'package:expense_app/widgets/chart.dart';
import 'package:expense_app/widgets/transaction_list.dart';

import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              headline6: TextStyle(
                fontFamily: 'QuickSand',
                fontSize: 12,
                color: Colors.black54,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans', fontSize: 20, color: Colors.white),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 54.99,
      date: DateTime.now().subtract(Duration(days: 7)),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 32.53,
      date: DateTime.now().subtract(Duration(days: 7)),
    ),
    Transaction(
      id: 't3',
      title: 'New Shoes',
      amount: 11.99,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    Transaction(
      id: 't4',
      title: 'Weekly Groceries',
      amount: 1.53,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: 't5',
      title: 'New Shoes',
      amount: 44.99,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: 't6',
      title: 'Weekly Groceries',
      amount: 46.53,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't7',
      title: 'New Shoes',
      amount: 61.99,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't8',
      title: 'Weekly Groceries',
      amount: 12.53,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't9',
      title: 'New Shoes',
      amount: 29.99,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't10',
      title: 'Weekly Groceries',
      amount: 26.53,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't11',
      title: 'New Shoes',
      amount: 59.99,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't12',
      title: 'Weekly Groceries',
      amount: 11.53,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where(
            (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime choosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      amount: txAmount,
      title: txTitle,
      date: choosenDate,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _removeTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => id == element.id);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
              padding: EdgeInsets.only(right: 30),
              icon: Icon(Icons.add, size: 30.0),
              onPressed: () => startAddNewTransaction(context)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(_recentTransactions),
          TransactionList(_userTransactions, _removeTransaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
