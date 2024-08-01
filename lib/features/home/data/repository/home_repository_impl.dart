import 'package:dartz/dartz.dart';
import 'package:wallet/core/data_source/remote/api_service.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/core/utils/network_info.dart';
import 'package:wallet/features/home/data/mappers/user_response_mapper.dart';
import 'package:wallet/features/home/domain/entities/user_detail.dart';
import 'package:wallet/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ApiService api;
  final NetworkInfo networkInfo;

  const HomeRepositoryImpl(
    this.api,
    this.networkInfo
  );

  @override
  Future<Either<Failure, UserDetail>> getUser() async {
    if(!await networkInfo.isNetworkConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final response = await api.userService();
      return Right(response.toDomain);
    } catch (error) {
      return const Left(ServerFailure());
    }
  }
}