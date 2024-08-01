
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/core/di/di.dart';
import 'package:wallet/core/widgets/scaffolds.dart';
import 'package:wallet/features/send_money/domain/usecases/send_money_usecase.dart';
import 'package:wallet/features/send_money/presentation/cubit/send_money_cubit.dart';
import 'package:wallet/features/send_money/presentation/widgets/send_money_content.dart';
import 'package:wallet/res/colors.dart';
import 'package:wallet/res/strings.dart';

class SendMoneyScreen extends StatelessWidget {
  final double balance;

  const SendMoneyScreen({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => SendMoneyCubit(instance<SendMoneyUseCase>(), balance),
    child: SafeScaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text(
          Strings.sendMoney,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        backgroundColor: ColorManager.white,
      ),
      body: const SendMoneyContent()
    ),
  );
}
