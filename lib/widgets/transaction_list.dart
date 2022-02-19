import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
                leading: CircleAvatar(
                    radius: 40,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: FittedBox(
                        child: Text(
                            '₹${transactions[index].amount.toStringAsFixed(2)}'),
                      ),
                    )),
                trailing: IconButton(
                    icon:
                        Icon(Icons.delete, color: Theme.of(context).errorColor),
                    onPressed: () => deleteTx(transactions[index].id)),
                title: Text(
                  transactions[index].title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle:
                    Text(DateFormat.yMMMd().format(transactions[index].date))),
          );
          // return Card(
          //     child:
          //         // Text(tx.title));
          //         Row(children: <Widget>[
          //   Container(
          //     margin: EdgeInsets.symmetric(
          //       vertical: 10,
          //       horizontal: 15,
          //     ),
          //     decoration: BoxDecoration(
          //         border: Border.all(
          //           color: Theme.of(context).primaryColorDark,
          //           width: 2,
          //           style: BorderStyle.solid,
          //         ),
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(10),
          //         )),
          //     padding: EdgeInsets.all(10),
          //     child: Text(
          //       '₹${transactions[index].amount.toStringAsFixed(2)}',
          //       style: Theme.of(context).textTheme.headline6,
          //       // TextStyle(color: Colors.purple),
          //       // style: TextStyle(
          //       //     fontFamily: 'OpenSans',
          //       //     fontWeight: FontWeight.bold,
          //       //     fontSize: 20,
          //       //     color: Colors.purple),
          //     ),
          //   ),
          //   Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Text(transactions[index].title,
          //             style: TextStyle(
          //                 color: Colors.black,
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.w600)),
          //         Text(DateFormat.yMMMd().format(transactions[index].date),
          //             style: TextStyle(color: Colors.grey, fontSize: 10)),
          //       ])
          // ]));
        },
        itemCount: transactions.length,
      ),
    );
  }
}
