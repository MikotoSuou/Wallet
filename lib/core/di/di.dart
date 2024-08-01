


import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wallet/core/data_source/remote/dio_factory.dart';
import 'package:wallet/features/home/data/repository/home_repository_impl.dart';
import 'package:wallet/features/home/domain/repository/home_repository.dart';
import '../data_source/remote/api_service.dart';
import '../utils/network_info.dart';


final instance = GetIt.instance;

class AppModule {
  static Future<void> get initialize async {
    // network info
    instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

    // remote data source
    instance.registerLazySingleton<DioFactory>(() => const DioFactory());
    final dio = await instance<DioFactory>().createDio();
    instance.registerLazySingleton<ApiService>(() => ApiService(dio));

    // home repository
    instance.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(instance(), instance()));
  }
}