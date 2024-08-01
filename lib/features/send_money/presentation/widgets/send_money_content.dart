
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet/core/widgets/buttons.dart';
import 'package:wallet/core/widgets/decorations.dart';
import 'package:wallet/features/send_money/presentation/cubit/send_money_cubit.dart';
import 'package:wallet/features/send_money/presentation/widgets/send_money_amount_field.dart';
import 'package:wallet/res/assets.dart';
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

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: SendMoneyAmountField(),
            ),

            const Space(width: values.Size.s10),

            SecondaryButton(
              onClicked: () => context.read<SendMoneyCubit>().sendClicked(),
              icon: SvgPicture.asset(SvgAssets.icSend),
            ),
          ],
        ),
      ],
    ),
  );
}
