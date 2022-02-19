// import 'package:flutter/material.dart';
// import 'package:notes/widgets/new_transaction.dart';
// import '../models/transaction.dart';
// import '/widgets/transaction_list.dart';

// final List<Transaction> _userTansactions = [
//   Transaction(
//     id: 't1',
//     title: 'New Shoes',
//     amount: 676,
//     date: DateTime.now(),
//   ),
//   Transaction(
//       id: 't2', title: 'Weekly Groccery', amount: 89.99, date: DateTime.now()),
// ];

// class UserTransactions extends StatefulWidget {
//   @override
//   _UserTransactionsState createState() => _UserTransactionsState();
// }

// class _UserTransactionsState extends State<UserTransactions> {
//   void _addNewTransaction(String title, double amount) {
//     final newTx = Transaction(
//         title: title,
//         amount: amount,
//         date: DateTime.now(),
//         id: DateTime.now().toString());
//     setState(() {
//       _userTansactions.add(newTx);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       NewTransaction(_addNewTransaction),
//       TransactionList(_userTansactions)
//     ]);
//   }
// }
