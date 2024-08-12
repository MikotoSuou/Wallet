
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet/core/widgets/scaffolds.dart';
import 'package:wallet/features/home/presentation/widgets/home_appbar_title.dart';
import 'package:wallet/features/home/presentation/widgets/home_balance.dart';
import 'package:wallet/features/home/presentation/widgets/home_balance_toggle.dart';
import 'package:wallet/features/home/presentation/widgets/home_send_money_button.dart';
import 'package:wallet/res/colors.dart';
import 'package:wallet/res/values.dart' as values;

import '../../../core/navigation/routes.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/decorations.dart';
import '../../../res/assets.dart';
import '../../../res/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeScaffold(
    appBar: AppBar(
      title: const HomeAppBarTitle(),
      backgroundColor: ColorManager.background,
    ),
    body: Padding(
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

                      HomeBalanceToggle(
                        key: ValueKey("homeToggle"),
                      )
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
                      const Expanded(child: HomeSendMoneyButton()),

                      const Space(width: values.Size.s10),

                      SecondaryButton(
                        key: const ValueKey('transactionsButton'),
                        onClicked: () => context.push(Routes.transactions),
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
    ),
  );
}
