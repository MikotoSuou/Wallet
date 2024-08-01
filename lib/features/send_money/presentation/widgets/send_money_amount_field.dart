import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet/core/utils/constants.dart';
import 'package:wallet/core/utils/enums.dart';
import 'package:wallet/core/utils/helpers.dart';
import 'package:wallet/core/widgets/buttons.dart';
import 'package:wallet/features/send_money/presentation/cubit/send_money_cubit.dart';
import 'package:wallet/res/strings.dart';

class SendMoneyAmountField extends StatefulWidget {
  const SendMoneyAmountField({super.key});

  @override
  State<SendMoneyAmountField> createState() => _SendMoneyAmountFieldState();
}

class _SendMoneyAmountFieldState extends State<SendMoneyAmountField> {

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocListener<SendMoneyCubit, SendMoneyState>(
    listener: (context, state) {
      if(state.status == Status.success) {
        _controller.clear();
        hideSoftKeyboard();

        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            height: 300,
            alignment: Alignment.center,
            child: PrimaryButton(onClicked: () => context.pop(), text: "Close"),
          )
        );
      }
    },
    child: TextField(
      controller: _controller,
      onChanged: (value) =>  context.read<SendMoneyCubit>().amountChanged(value),
      keyboardType: TextInputType.number,
      inputFormatters: [
        CurrencyTextInputFormatter.currency(
          locale: Constants.locale,
          name: Constants.currencySymbol,
          decimalDigits: 2,
          maxValue: Constants.maxAmount,
        ),
      ],
      decoration: const InputDecoration(hintText: Strings.enterAmount),
    ),
  );
}
