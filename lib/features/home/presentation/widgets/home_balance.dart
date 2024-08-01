
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/core/utils/constants.dart';
import 'package:wallet/core/utils/extensions/double_ext.dart';
import 'package:wallet/core/widgets/decorations.dart';
import 'package:wallet/features/home/presentation/cubit/home_cubit.dart';
import 'package:wallet/res/values.dart' as values;


class HomeBalance extends StatelessWidget {
  const HomeBalance({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) {
      if(state.status == HomeStatus.loading) {
        return const ShimmerWidget(height: values.Size.s20);
      }

      return Text(
        (state.isToggled) ? state.balance.toStringAmount : Constants.obscuredBalance,
        style: Theme.of(context).textTheme.titleLarge,
        overflow: TextOverflow.ellipsis,
      );
    }
  );
}
