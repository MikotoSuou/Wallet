
import 'package:get_it/get_it.dart';
import 'package:wallet/core/di/network_module.dart';
import 'package:wallet/core/di/repository_module.dart';

final instance = GetIt.instance;

class AppModule {
  static Future<void> get initialize async {
    await NetworkModule.initialize;
    RepositoryModule.initialize;
  }
}