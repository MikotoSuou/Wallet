import 'package:flutter/material.dart';
import 'package:wallet/core/navigation/router.dart';
import 'package:wallet/res/theme.dart';

class WLApp extends StatelessWidget {
  const WLApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    theme: applicationTheme,
    routerConfig: router,
  );
}