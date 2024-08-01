
import 'package:dartz/dartz.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/home/domain/entities/user_detail.dart';
import 'package:wallet/features/home/domain/repository/home_repository.dart';

class GetUserUseCase {
  final HomeRepository _repository;
  GetUserUseCase(this._repository);

  Future<Either<Failure, UserDetail>> call() async {
    return await _repository.getUser();
  }
}