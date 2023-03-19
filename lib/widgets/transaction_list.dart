import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;

  TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    //we can also use SingleChildScrollView in the below child
    // child: SingleChildScrollView(
    //   child: Column(
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                //SizedBox widget is generally used to seperate widgets by some space
                const SizedBox(
                  height: 50,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                  height: constraints.maxHeight * 0.6,
                )
              ],
            );
          })
        : ListView.builder(
            // for very long list we use ListView.builder to enhance the performance
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: transactions[index], deletetx: deletetx);
            },
            itemCount: transactions.length,
            // children: transactions.map((tx) {  //this is mapping approach
            //   return Card()
            // }).toList(),
          );
  }
}
