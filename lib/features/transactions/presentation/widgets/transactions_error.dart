
import 'package:flutter/material.dart';

class TransactionsError extends StatelessWidget {
  final String message;

  const TransactionsError({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      message,
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}
