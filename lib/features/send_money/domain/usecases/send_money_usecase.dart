
import 'package:dartz/dartz.dart';
import 'package:wallet/features/send_money/domain/repository/send_money_repository.dart';

import '../../../../core/error/failure.dart';

class SendMoneyUseCase {
  final SendMoneyRepository _repository;
  SendMoneyUseCase(this._repository);

  Future<Either<Failure, UpdatedBalance>> call({
    required double balance,
    required double amountToSend,
  }) async {
    if (amountToSend == 0) {
      return const Left(InvalidAmountFailure());
    }

    if (amountToSend > balance) {
      return const Left(InsufficientBalanceFailure());
    }

    final result = await _repository.sendMoney(amountToSend);
    final newBalance = balance - amountToSend;
    return result.fold(
      (error) => Left(error),
      (success) async => await _repository.updateBalance(newBalance)
    );
  }
}