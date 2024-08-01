
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet/core/di/di.dart';
import 'package:wallet/core/widgets/scaffolds.dart';
import 'package:wallet/features/home/presentation/cubit/home_cubit.dart';
import 'package:wallet/features/home/presentation/widgets/home_appbar_title.dart';
import 'package:wallet/features/home/presentation/widgets/home_content.dart';
import 'package:wallet/res/colors.dart';

import '../domain/repository/home_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => HomeCubit(instance<HomeRepository>())..getUser(),
    child: SafeScaffold(
      appBar: AppBar(
        title: const HomeAppBarTitle(),
        backgroundColor: ColorManager.background,
      ),
      body: const HomeContent(),
    ),
  );
}
