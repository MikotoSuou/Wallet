import 'package:dartz/dartz.dart';
import 'package:wallet/core/data_source/remote/api_service.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/core/utils/helpers.dart';
import 'package:wallet/core/utils/network_info.dart';
import 'package:wallet/features/send_money/data/requests/send_money_request.dart';
import 'package:wallet/features/send_money/data/requests/update_balance_request.dart';
import 'package:wallet/features/send_money/domain/repository/send_money_repository.dart';

class SendMoneyRepositoryImpl implements SendMoneyRepository {
  final ApiService api;
  final NetworkInfo networkInfo;

  const SendMoneyRepositoryImpl(
    this.api,
    this.networkInfo
  );

  @override
  Future<Either<Failure, void>> sendMoney(double amount) async {
    if(!await networkInfo.isNetworkConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final request = SendMoneyRequest(amount: amount, date: currentDate, time: currentTime);
      await api.sendMoneyService(request);
      return const Right(null);
    } catch (error) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateBalance(double balance, double amountToDeduct) async {
    if(!await networkInfo.isNetworkConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final newBalance = balance - amountToDeduct;
      final request = UpdateBalanceRequest(balance: newBalance);
      await api.updateBalanceService(request);
      return const Right(null);
    } catch (error) {
      return const Left(ServerFailure());
    }
  }
}