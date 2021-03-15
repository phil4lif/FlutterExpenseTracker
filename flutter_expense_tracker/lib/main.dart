import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/widgets/transaction_list.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          fontFamily: 'OpenSans',
          primarySwatch: Colors.blueGrey,
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(fontFamily: 'OpenSans', fontSize: 20)),
          ),
          accentColor: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 420.69,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'stonks',
      amount: 500.05,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 420.69,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'stonks',
      amount: 500.05,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 420.69,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'stonks',
      amount: 500.05,
      date: DateTime.now(),
    )
  ];

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.amber,
              child: Text('Chart'),
              elevation: 15,
            ),
            TransactionList(_userTransactions),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ));
  }
}
