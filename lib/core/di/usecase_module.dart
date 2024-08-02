
import 'package:wallet/core/di/di.dart';
import 'package:wallet/features/send_money/domain/usecases/send_money_usecase.dart';
import 'package:wallet/features/transactions/domain/usecases/get_transactions_usecase.dart';

import '../../features/home/domain/usecases/get_user_usecase.dart';

void initHomeDependencies() {
  if(!instance.isRegistered<GetUserUseCase>()) {
    instance.registerFactory<GetUserUseCase>(() => GetUserUseCase(instance()));
  }
}

void initSendMoneyDependencies() {
  if(!instance.isRegistered<SendMoneyUseCase>()) {
    instance.registerFactory<SendMoneyUseCase>(() => SendMoneyUseCase(instance()));
  }
}

void initTransactionsDependencies() {
  if(!instance.isRegistered<GetTransactionsUseCase>()) {
    instance.registerFactory<GetTransactionsUseCase>(() => GetTransactionsUseCase(instance()));
  }
}
