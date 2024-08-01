
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class SendMoneyRepository {
  Future<Either<Failure, void>> sendMoney(double amount);
}