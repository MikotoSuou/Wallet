
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet/core/di/app_module.dart';
import 'package:wallet/core/navigation/routes.dart';
import 'package:wallet/features/home/presentation/cubit/home_cubit.dart';
import 'package:wallet/features/home/presentation/home_screen.dart';
import 'package:wallet/features/send_money/presentation/cubit/send_money/send_money_cubit.dart';
import 'package:wallet/features/send_money/presentation/send_money_screen.dart';
import 'package:wallet/features/transactions/domain/usecases/get_transactions_usecase.dart';
import 'package:wallet/features/transactions/presentation/cubit/transactions_cubit.dart';
import 'package:wallet/features/transactions/presentation/transactions_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.home,
  routes: [

    // home route
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: Routes.home,
      pageBuilder: (context, state) => AppTransition.none(
        state: state,
        child: BlocProvider(
          create: (_) => instance<HomeCubit>()
            ..getUser(),
          child: const HomeScreen(),
        ),
      ),
    ),

    // send money route
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: Routes.sendMoney,
      pageBuilder: (context, state) {
        return AppTransition.slide(
          state: state,
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: instance<HomeCubit>()),
              BlocProvider(create: (_) => instance<SendMoneyCubit>()),
            ],
            child: const SendMoneyScreen(),
          ),
        );
      },
    ),

    // transactions route
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: Routes.transactions,
      pageBuilder: (context, state) => AppTransition.slide(
        state: state,
        child: BlocProvider(
          create: (_) => instance<TransactionsCubit>()
            ..getTransactions(),
          child: const TransactionsScreen(),
        ),
      ),
    ),
  ],

);


class AppTransition {

  static NoTransitionPage none({
    required GoRouterState state,
    required Widget child
  }) => NoTransitionPage(
    key: state.pageKey,
    child: child,
  );

  static CustomTransitionPage slide({
    required GoRouterState state,
    required Widget child
  }) => CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );

}