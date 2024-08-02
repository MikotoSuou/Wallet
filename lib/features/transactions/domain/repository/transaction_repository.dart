
import 'package:dartz/dartz.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/transactions/domain/entities/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<Transaction>>> getTransactions();
}