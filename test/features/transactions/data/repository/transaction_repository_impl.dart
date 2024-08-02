
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/home/data/repository/home_repository_impl.dart';
import 'package:wallet/features/home/data/responses/user_response.dart';
import 'package:wallet/features/home/domain/entities/user_detail.dart';
import 'package:wallet/features/home/domain/repository/home_repository.dart';
import 'package:wallet/features/transactions/data/repository/transaction_repository_impl.dart';
import 'package:wallet/features/transactions/data/responses/transaction_response.dart';
import 'package:wallet/features/transactions/domain/entities/transaction.dart';
import 'package:wallet/features/transactions/domain/repository/transaction_repository.dart';

import '../../../../core/data_source/remote/api_service_mock.mocks.dart';
import '../../../../core/utils/network_info/network_info_mock.mocks.dart';


void main() {
  late MockApiService api;
  late MockNetworkInfo networkInfo;
  late TransactionRepository repository;

  setUpAll(() {
    api = MockApiService();
    networkInfo = MockNetworkInfo();

    repository = TransactionRepositoryImpl(api, networkInfo);
  });

  group('getUser', () {
    test('should return failure when the device is offline', () async {
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => false);

      final result = await repository.getTransactions();

      expect(result.isLeft(), isTrue);
      expect(result, const Left(NetworkFailure()));
    });

    test('should return the correct data on successful get transactions', () async {
      const response = [
        TransactionResponse(id: "1", amount: 1.0, date: "Aug 02, 2024", time: "11:11 AM"),
        TransactionResponse(id: "2", amount: 1.0, date: "Aug 02, 2024", time: "12:12 AM"),
      ];
      const expectedResult = [
        Transaction(id: "1", amount: 1.0, date: "Aug 02, 2024", time: "11:11 AM"),
        Transaction(id: "2", amount: 1.0, date: "Aug 02, 2024", time: "12:12 AM"),
      ];
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);
      when(api.transactionsService()).thenAnswer((_) async => Future.value(response));

      final result = await repository.getTransactions();

      print('Result: $result');
      print('Expected: ${Right(expectedResult)}');

      expect(result.isRight(), isTrue);
      expect(result, const Right(expectedResult));
    });

    test('should return failure on failed get transactions', () async {
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);
      when(api.transactionsService()).thenThrow(const ServerFailure());

      final result = await repository.getTransactions();

      expect(result.isLeft(), isTrue);
      expect(result, const Left(ServerFailure()));
    });
  });

}