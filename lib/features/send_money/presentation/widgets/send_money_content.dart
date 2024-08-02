
import 'package:flutter/material.dart';
import 'package:wallet/core/widgets/decorations.dart';
import 'package:wallet/features/send_money/presentation/widgets/send_money_amount_field.dart';
import 'package:wallet/features/send_money/presentation/widgets/send_money_button.dart';
import 'package:wallet/res/strings.dart';
import 'package:wallet/res/values.dart' as values;

class SendMoneyContent extends StatelessWidget {
  const SendMoneyContent({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(
      vertical: values.Size.s8,
      horizontal: values.Size.s16,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.amountToSend,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: SendMoneyAmountField()),

            Space(width: values.Size.s10),

            SendMoneyButton()
          ],
        ),
      ],
    ),
  );
}
