import 'package:dartz/dartz.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/home/domain/entities/user_detail.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserDetail>> getUser();
}