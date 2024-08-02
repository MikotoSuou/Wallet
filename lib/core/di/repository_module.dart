import 'dart:async';
import 'package:wallet/features/home/data/repository/home_repository_impl.dart';
import 'package:wallet/features/home/domain/repository/home_repository.dart';
import 'package:wallet/features/send_money/data/repository/send_money_repository_impl.dart';
import 'package:wallet/features/send_money/domain/repository/send_money_repository.dart';
import 'package:wallet/features/transactions/data/repository/transaction_repository_impl.dart';
import 'package:wallet/features/transactions/domain/repository/transaction_repository.dart';
import 'di.dart';

class RepositoryModule {
  static Future<void> get initialize async {
    instance.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(instance(), instance()));
    instance.registerLazySingleton<SendMoneyRepository>(() => SendMoneyRepositoryImpl(instance(), instance()));
    instance.registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(instance(), instance()));
  }
}