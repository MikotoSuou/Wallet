import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:wallet/core/utils/constants.dart';
import 'package:wallet/core/utils/enums.dart';
import 'package:wallet/core/utils/helpers.dart';
import 'package:wallet/core/widgets/decorations.dart';
import 'package:wallet/features/send_money/presentation/cubit/send_money_cubit.dart';
import 'package:wallet/res/assets.dart';
import 'package:wallet/res/strings.dart';
import 'package:wallet/res/values.dart' as values;


class SendMoneyAmountField extends StatefulWidget {
  const SendMoneyAmountField({super.key});

  @override
  State<SendMoneyAmountField> createState() => _SendMoneyAmountFieldState();
}

class _SendMoneyAmountFieldState extends State<SendMoneyAmountField> {

  final _controller = TextEditingController();

  void showPrompt(String animPath, String promptMessage) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: values.Size.s250,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: values.Size.s16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: values.Size.s150,
              height: values.Size.s150,
              child: Lottie.asset(
                animPath,
                repeat: false,
              ),
            ),

            Text(
              promptMessage,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const Space(height: values.Size.s10),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => BlocListener<SendMoneyCubit, SendMoneyState>(
    listener: (context, state) => switch(state.status) {
      Status.success => {
        _controller.clear(),
        hideSoftKeyboard(),
        showPrompt(AnimAssets.animSuccess, Strings.moneySent),
      },
      Status.failed => {
        hideSoftKeyboard(),
        showPrompt(AnimAssets.animError, state.error),
      },
      _ => {}
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
