import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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
  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            color: Colors.amber,
            child: Text('Chart'),
            elevation: 15,
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      controller: titleController,
                      // onChanged: (value) {
                      //   titleInput = value;
                      // },
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: amountController,
                      // onChanged: (value) {
                      //   amountInput = value;
                      // },
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      textColor: Colors.purple,
                      onPressed: () {
                        print(titleController.text);
                        print(amountController.text);
                      },
                    )
                  ]),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '\$${tx.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(
                              fontSize: 14,
                            )),
                      ])
                ],
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
