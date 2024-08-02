
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet/features/send_money/presentation/cubit/send_money_form/send_money_form_cubit.dart';

import '../../../../core/widgets/buttons.dart';
import '../../../../res/assets.dart';
import '../cubit/send_money/send_money_cubit.dart';

class SendMoneyButton extends StatelessWidget {
  const SendMoneyButton({super.key});

  void _onSubmitClicked(BuildContext context) {
    final amount = context.read<SendMoneyFormCubit>().state.amount;
    context.read<SendMoneyCubit>().sendClicked(amount);
  }

  @override
  Widget build(BuildContext context) => SecondaryButton(
    onClicked: () => _onSubmitClicked(context),
    icon: SvgPicture.asset(SvgAssets.icSend),
  );
}
