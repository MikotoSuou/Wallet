
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet/core/navigation/routes.dart';
import 'package:wallet/core/widgets/buttons.dart';
import 'package:wallet/core/widgets/decorations.dart';
import 'package:wallet/features/home/presentation/cubit/home_cubit.dart';
import 'package:wallet/features/home/presentation/widgets/home_balance.dart';
import 'package:wallet/features/home/presentation/widgets/home_balance_toggle.dart';
import 'package:wallet/features/home/presentation/widgets/home_send_money_button.dart';
import 'package:wallet/res/assets.dart';
import 'package:wallet/res/colors.dart';
import 'package:wallet/res/strings.dart';
import 'package:wallet/res/values.dart' as values;


class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: values.Size.s16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: values.Size.s10,
              horizontal: values.Size.s16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: HomeBalance()),

                    Space(width: values.Size.s5),

                    HomeBalanceToggle()
                  ],
                ),

                Text(
                  Strings.walletBalance,
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                const Space(height: values.Size.s10),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: HomeSendMoneyButton()
                    ),

                    const Space(width: values.Size.s10),

                    SecondaryButton(
                      onClicked: () {},
                      icon: SvgPicture.asset(SvgAssets.icTransactions),
                    ),
                  ],
                ),

                const Space(height: values.Size.s5),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
