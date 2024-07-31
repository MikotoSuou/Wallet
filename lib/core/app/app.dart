import 'package:flutter/material.dart';
import 'package:wallet/features/home/presentation/home_screen.dart';
import 'package:wallet/res/theme.dart';

class WLApp extends StatelessWidget {
  const WLApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: applicationTheme,
    home: const HomeScreen(),
  );
}