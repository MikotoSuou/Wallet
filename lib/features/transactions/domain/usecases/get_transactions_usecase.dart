
import 'package:dartz/dartz.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/home/domain/entities/user_detail.dart';
import 'package:wallet/features/home/domain/repository/home_repository.dart';
import 'package:wallet/features/transactions/domain/entities/transaction.dart';
import 'package:wallet/features/transactions/domain/repository/transaction_repository.dart';

class GetTransactionsUseCase {
  final TransactionRepository _repository;
  GetTransactionsUseCase(this._repository);

  Future<Either<Failure, List<Transaction>>> call() async {
    return await _repository.getTransactions();
  }
}