import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(transaction.location, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text(transaction.date, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          const Divider(), // Garis pemisah antar item
        ],
      ),
    );
  }
}
