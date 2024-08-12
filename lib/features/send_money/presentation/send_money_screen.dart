
import 'package:flutter/material.dart';
import 'package:wallet/core/widgets/scaffolds.dart';
import 'package:wallet/features/send_money/presentation/widgets/send_money_amount_field.dart';
import 'package:wallet/features/send_money/presentation/widgets/send_money_button.dart';
import 'package:wallet/res/colors.dart';
import 'package:wallet/res/strings.dart';
import 'package:wallet/res/values.dart' as values;

import '../../../core/widgets/decorations.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeScaffold(
    backgroundColor: ColorManager.white,
    appBar: AppBar(
      title: Text(
        Strings.sendMoney,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      centerTitle: true,
      backgroundColor: ColorManager.white,
    ),
    body: Padding(
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

              SendMoneyButton(key: ValueKey('submitButton'))
            ],
          ),
        ],
      ),
    ),
  );

}
