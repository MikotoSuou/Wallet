
import 'package:wallet/core/di/app_module.dart';
import 'package:wallet/features/home/presentation/cubit/home_cubit.dart';
import 'package:wallet/features/send_money/presentation/cubit/send_money/send_money_cubit.dart';
import 'package:wallet/features/transactions/presentation/cubit/transactions_cubit.dart';


class BlocModule {
  static void get initialize {
    instance.registerLazySingleton<HomeCubit>(() => HomeCubit(instance()));
    instance.registerFactory<SendMoneyCubit>(() => SendMoneyCubit(instance()));
    instance.registerFactory<TransactionsCubit>(() => TransactionsCubit(instance()));
  }
}