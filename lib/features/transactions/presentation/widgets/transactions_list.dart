
import 'package:flutter/material.dart';
import 'package:wallet/features/transactions/presentation/widgets/transactions_list_tile.dart';
import 'package:wallet/res/values.dart' as values;

import '../cubit/transactions_cubit.dart';

class TransactionsList extends StatelessWidget {
  final List<TransactionItem> transactionItems;

  const TransactionsList({
    super.key,
    required this.transactionItems
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: values.Size.s16),
    itemCount: transactionItems.length,
    itemBuilder: (context, index) {
      final item = transactionItems[index];

      return item.when(
        date: (date) => (index == 0 || index == transactionItems.length-1)
            ? TransactionDate(date: date)
            : TransactionDateWithDivider(date: date),
        transaction: (transaction) => TransactionTile(transaction: transaction),
      );
    },
  );
}
