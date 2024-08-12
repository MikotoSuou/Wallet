
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

typedef UpdatedBalance = double;

abstract class SendMoneyRepository {
  Future<Either<Failure, void>> sendMoney(double amount);
  Future<Either<Failure, UpdatedBalance>> updateBalance(double newBalance);
}