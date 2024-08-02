
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
import 'package:wallet/res/assets.dart';
import 'package:wallet/res/colors.dart';
import 'package:wallet/res/strings.dart';
import 'package:wallet/res/values.dart' as values;


class HomeSendMoneyButton extends StatelessWidget {
  const HomeSendMoneyButton({super.key});

  Future<void> _onSendClicked(BuildContext context) async {
    final balance = context.read<HomeCubit>().state.balance;
    await context.push(Routes.sendMoney, extra: balance);

    if(context.mounted) {
      context.read<HomeCubit>().getUser();
    }
  }

  @override
  Widget build(BuildContext context) => PrimaryButton(
    icon: SvgPicture.asset(SvgAssets.icSendMoney),
    onClicked: () => _onSendClicked(context),
    text: Strings.send,
  );
}
