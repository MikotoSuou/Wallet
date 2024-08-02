import 'package:flutter/material.dart';
import 'package:wallet/core/di/di.dart';
import 'core/app/app.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppModule.initialize;
  runApp(const WLApp());
}