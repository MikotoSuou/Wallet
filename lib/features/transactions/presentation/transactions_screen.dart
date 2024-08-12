
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/features/transactions/presentation/cubit/transactions_cubit.dart';
import 'package:wallet/features/transactions/presentation/widgets/transactions_empty.dart';
import 'package:wallet/features/transactions/presentation/widgets/transactions_error.dart';
import 'package:wallet/features/transactions/presentation/widgets/transactions_list.dart';
import 'package:wallet/features/transactions/presentation/widgets/transactions_loading.dart';

import '../../../core/widgets/scaffolds.dart';
import '../../../res/colors.dart';
import '../../../res/strings.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeScaffold(
    backgroundColor: ColorManager.white,
    appBar: AppBar(
      title: Text(
        Strings.transactions,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      centerTitle: true,
      backgroundColor: ColorManager.white,
    ),
    body: BlocBuilder<TransactionsCubit, TransactionsState>(
      buildWhen: (prev, current) => (prev.status != current.status),
      builder: (context, state) => switch(state.status) {
        TransactionsStatus.loading => const TransactionsLoading(),
        TransactionsStatus.empty => const TransactionsEmpty(),
        TransactionsStatus.success => TransactionsList(transactionItems: state.transactionItems),
        TransactionsStatus.failed => TransactionsError(message: state.error),
      },
    ),
  );
}
