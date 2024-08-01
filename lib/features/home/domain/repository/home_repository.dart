import 'package:dartz/dartz.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/home/domain/entities/User.dart';

abstract class HomeRepository {
  Future<Either<Failure, User>> getUser();
}