
import 'package:dartz/dartz.dart';
import 'package:wallet/features/send_money/domain/repository/send_money_repository.dart';

import '../../../../core/error/failure.dart';

class SendMoneyUsecase {
  final SendMoneyRepository _repository;
  SendMoneyUsecase(this._repository);

  Future<Either<Failure, void>> call({
    required double availableBalance,
    required double amountToSend,
  }) async {
    if(amountToSend == 0) {
      return const Left(InvalidAmountFailure());
    }

    if(amountToSend > availableBalance) {
      return const Left(InsufficientBalanceFailure());
    }

    return _repository.sendMoney(amountToSend);
  }
}