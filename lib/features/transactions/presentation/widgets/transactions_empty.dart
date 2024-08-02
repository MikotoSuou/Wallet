
import 'package:flutter/material.dart';
import 'package:wallet/res/strings.dart';

class TransactionsEmpty extends StatelessWidget {
  const TransactionsEmpty({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      Strings.noTransactions,
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}
