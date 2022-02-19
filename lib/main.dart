import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/widgets/new_transaction.dart';
import 'package:notes/widgets/user_transaction.dart';
import 'models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTansactions = [
//   Transaction(
//     id: 't1',
//     title: 'New Shoes',
//     amount: 676,
//     date: DateTime.now(),
//   ),
//   Transaction(
//       id: 't2', title: 'Weekly Groccery', amount: 89.99, date: DateTime.now()),
  ];
  List<Transaction> get _recentTransactions {
    return _userTansactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _deleteTransaction(String deletedId) {
    setState(() {
      _userTansactions.removeWhere((tx) {
        return tx.id == deletedId;
      });
    });
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: chosenDate,
        id: DateTime.now().toString());
    setState(() {
      _userTansactions.add(newTx);
    });
  }

  @override
  String titleInput;

  String amountInput;

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: NewTransaction(_addNewTransaction));
        });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'QuickSand',
          //primaryColor: Colors.purpleAccent,
          primarySwatch: Colors.purple,
          accentColor: Colors.amber[200],
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
                button: TextStyle(color: Colors.white),
              ),

          //accentColor: Colors.purpleAccent,
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 20,
                  fontWeight: FontWeight.normal))),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Personal Expenses'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _startAddNewTransaction(context);
                },
              )
            ],
          ),
          body: SingleChildScrollView(
            child: _userTansactions.isEmpty
                ? Column(children: [
                    Container(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text("No Transactions yet !",
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Container(
                        height: 200,
                        child: Image.asset("assets/images/waiting.png",
                            fit: BoxFit.cover)),
                  ])
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                        Chart(_userTansactions),
                        TransactionList(_userTansactions, _deleteTransaction)
                      ]),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
              tooltip: 'Increment',
              child: new Icon(
                Icons.add,
                //color: Colors.purple.shade900,
              ),
              //backgroundColor: Colors.white,
              onPressed: () {
                _startAddNewTransaction(context);
              })),
    );
  }
}
