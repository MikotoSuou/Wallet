
import 'package:wallet/core/di/app_module.dart';
import 'package:wallet/features/send_money/domain/usecases/send_money_usecase.dart';
import 'package:wallet/features/transactions/domain/usecases/get_transactions_usecase.dart';

import '../../features/home/domain/usecases/get_user_usecase.dart';

class UseCaseModule {
  static void get initialize {
    instance.registerFactory<GetUserUseCase>(() => GetUserUseCase(instance()));
    instance.registerFactory<SendMoneyUseCase>(() => SendMoneyUseCase(instance()));
    instance.registerFactory<GetTransactionsUseCase>(() => GetTransactionsUseCase(instance()));
  }
}