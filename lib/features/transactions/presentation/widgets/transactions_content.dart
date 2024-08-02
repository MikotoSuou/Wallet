
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/features/transactions/presentation/cubit/transactions_cubit.dart';
import 'package:wallet/features/transactions/presentation/widgets/transactions_empty.dart';
import 'package:wallet/features/transactions/presentation/widgets/transactions_error.dart';
import 'package:wallet/features/transactions/presentation/widgets/transactions_list.dart';
import 'package:wallet/features/transactions/presentation/widgets/transactions_loading.dart';

class TransactionsContent extends StatelessWidget {
  const TransactionsContent({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<TransactionsCubit, TransactionsState>(
    builder: (context, state) => state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const TransactionsLoading(),
      empty: () => const TransactionsEmpty(),
      success: (transactions) => TransactionsList(transactions: transactions),
      failed: (error) => TransactionsError(message: error),
    ),
  );
}
