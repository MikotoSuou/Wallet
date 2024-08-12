
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wallet/features/home/presentation/cubit/home_cubit.dart';
import 'package:wallet/features/home/presentation/home_screen.dart';
import 'package:wallet/features/home/presentation/widgets/home_appbar_title.dart';

import 'cubit/home_cubit_mock.mocks.dart';

void main() {
  late MockHomeCubit cubit;

  setUpAll(() {
    cubit = MockHomeCubit();
  });

  testWidgets("HomeScreen", (tester) async {
    when(cubit.state).thenReturn(const HomeState());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<HomeCubit>(
          create: (_) => cubit,
          child: const HomeScreen(),
        ),
      ),
    );

    // Verify that the AppBar title is rendered correctly
    expect(find.byType(HomeAppBarTitle), findsOneWidget);
  });
}