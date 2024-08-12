
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet/core/navigation/routes.dart';
import 'package:wallet/core/widgets/buttons.dart';
import 'package:wallet/res/assets.dart';
import 'package:wallet/res/strings.dart';


class HomeSendMoneyButton extends StatelessWidget {
  const HomeSendMoneyButton({super.key});

  @override
  Widget build(BuildContext context) => PrimaryButton(
    icon: SvgPicture.asset(SvgAssets.icSendMoney),
    onClicked: () => context.push(Routes.sendMoney),
    text: Strings.send,
  );
}
