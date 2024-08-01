import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/core/utils/constants.dart';
import 'package:wallet/features/send_money/presentation/cubit/send_money_cubit.dart';
import 'package:wallet/res/strings.dart';

class SendMoneyAmountField extends StatelessWidget {
  const SendMoneyAmountField({super.key});

  @override
  Widget build(BuildContext context) => TextField(
    onChanged: (value) =>  context.read<SendMoneyCubit>().amountChanged(value),
    keyboardType: TextInputType.number,
    inputFormatters: [
      CurrencyTextInputFormatter.currency(
        locale: Constants.locale,
        name: Constants.currencySymbol,
        decimalDigits: 2,
        maxValue: Constants.maxAmount
      ),
    ],
    decoration: const InputDecoration(hintText: Strings.enterAmount),
  );
}
