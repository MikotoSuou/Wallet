
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/core/widgets/decorations.dart';
import 'package:wallet/features/home/presentation/cubit/home_cubit.dart';
import 'package:wallet/res/strings.dart';
import 'package:wallet/res/values.dart' as values;


class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) => switch(state.status) {
      HomeStatus.initial => const SizedBox.shrink(),
      HomeStatus.loading => ShimmerWidget(
        width: MediaQuery.sizeOf(context).width * 0.3,
        height: values.Size.s16,
      ),
      HomeStatus.success => Text(
        "@${state.name}",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      HomeStatus.failed => Text(
        Strings.hello,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    }
  );
}
