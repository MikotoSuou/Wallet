
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet/features/home/presentation/cubit/home_cubit.dart';

import '../../../../core/widgets/buttons.dart';
import '../../../../res/assets.dart';
import '../cubit/send_money/send_money_cubit.dart';

class SendMoneyButton extends StatelessWidget {
  const SendMoneyButton({super.key});

  void _onSubmitClicked(BuildContext context) {
    final balance = context.read<HomeCubit>().state.balance;
    final amount = context.read<SendMoneyCubit>().state.amount;
    context.read<SendMoneyCubit>().sendClicked(balance, amount);
  }

  @override
  Widget build(BuildContext context) => SecondaryButton(
    onClicked: () => _onSubmitClicked(context),
    icon: SvgPicture.asset(SvgAssets.icSend),
  );
}
