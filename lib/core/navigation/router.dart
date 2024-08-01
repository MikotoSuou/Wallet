
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet/core/di/usecase_module.dart';
import 'package:wallet/core/navigation/routes.dart';
import 'package:wallet/features/home/presentation/home_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.home,
  routes: [

    // home route
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: Routes.home,
      pageBuilder: (context, state) {
        initHomeDependencies();
        return AppTransition.none(state: state, child: const HomeScreen());
      },
    ),

    // // send money route
    // GoRoute(
    //   parentNavigatorKey: rootNavigatorKey,
    //   path: Routes.productDetail,
    //   pageBuilder: (context, state) {
    //     initProductDetailDependencies();
    //     final args = state.extra as int;
    //     return AppTransition.slide(state: state, child: ProductDetailScreen(productId: args));
    //   }
    // ),

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