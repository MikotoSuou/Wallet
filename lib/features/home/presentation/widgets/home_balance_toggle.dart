
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet/features/home/presentation/cubit/home_cubit.dart';
import 'package:wallet/res/assets.dart';
import 'package:wallet/res/values.dart' as values;


class HomeBalanceToggle extends StatelessWidget {
  const HomeBalanceToggle({super.key});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => context.read<HomeCubit>().toggleClicked(),
    customBorder: const CircleBorder(),
    child: Container(
      padding: const EdgeInsets.all(values.Size.s5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => SvgPicture.asset(
          (state.isToggled) ? SvgAssets.icEyeOpen : SvgAssets.icEyeClose
        ),
      ),
    ),
  );

}
