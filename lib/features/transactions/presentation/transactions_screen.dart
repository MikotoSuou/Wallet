
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/core/di/di.dart';
import 'package:wallet/features/transactions/domain/usecases/get_transactions_usecase.dart';
import 'package:wallet/features/transactions/presentation/cubit/transactions_cubit.dart';
import 'package:wallet/features/transactions/presentation/widgets/transactions_content.dart';

import '../../../core/widgets/scaffolds.dart';
import '../../../res/colors.dart';
import '../../../res/strings.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => TransactionsCubit(instance<GetTransactionsUseCase>())
      ..getTransactions(),
    child: SafeScaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text(
          Strings.transactions,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        backgroundColor: ColorManager.white,
      ),
      body: const TransactionsContent(),
    ),
  );
}
