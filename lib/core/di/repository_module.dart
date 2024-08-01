import 'dart:async';
import 'package:wallet/features/home/data/repository/home_repository_impl.dart';
import 'package:wallet/features/home/domain/repository/home_repository.dart';
import 'di.dart';

class RepositoryModule {
  static Future<void> get initialize async {
    instance.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(instance(), instance()));
  }
}