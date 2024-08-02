import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wallet/core/data_source/remote/dio_factory.dart';
import '../data_source/remote/api_service.dart';
import '../utils/network_info.dart';
import 'di.dart';

class NetworkModule {
  static Future<void> get initialize async {
    // network info
    instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

    // dio
    instance.registerLazySingleton<DioFactory>(() => const DioFactory());
    final dio = await instance<DioFactory>().createDio();

    // retrofit
    instance.registerLazySingleton<ApiService>(() => ApiService(dio));
  }
}