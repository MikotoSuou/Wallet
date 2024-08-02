
import 'package:flutter/material.dart';
import 'package:wallet/core/utils/extensions/double_ext.dart';
import 'package:wallet/res/values.dart' as values;

import '../../domain/entities/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({
    super.key,
    required this.transactions
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: const EdgeInsets.symmetric(
      vertical: values.Size.s20,
      horizontal: values.Size.s16,
    ),
    itemCount: transactions.length,
    itemBuilder: (context, index) => ListTile(
      title: Text(transactions[index].amount.toStringAmount),
      titleTextStyle: Theme.of(context).textTheme.bodyMedium,
    ),
  );
}
