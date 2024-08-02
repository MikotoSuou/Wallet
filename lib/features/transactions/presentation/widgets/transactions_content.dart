
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/features/transactions/presentation/cubit/transactions_cubit.dart';
import 'package:wallet/features/transactions/presentation/widgets/transaction_list.dart';

class TransactionsContent extends StatelessWidget {
  const TransactionsContent({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<TransactionsCubit, TransactionsState>(
    builder: (context, state) => state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(), // use shimmer
      empty: () => const SizedBox.shrink(),
      success: (transactions) => TransactionList(transactions: transactions),
      failed: (error) => const SizedBox.shrink(),
    ),
  );
}
