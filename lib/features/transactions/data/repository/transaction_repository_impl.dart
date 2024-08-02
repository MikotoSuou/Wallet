
import 'package:dartz/dartz.dart';
import 'package:wallet/core/data_source/remote/api_service.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/core/utils/network_info.dart';
import 'package:wallet/features/transactions/domain/entities/transaction.dart';
import 'package:wallet/features/transactions/domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final ApiService api;
  final NetworkInfo networkInfo;

  const TransactionRepositoryImpl(
    this.api,
    this.networkInfo
  );

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions() async {
    if(!await networkInfo.isNetworkConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final response = await api.transactionsService();
      final data = response.map((transaction) => transaction.toDomain).toList();
      return Right(data);
    } catch (error) {
      return const Left(ServerFailure());
    }
  }
}