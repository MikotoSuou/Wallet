
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/send_money/data/repository/send_money_repository_impl.dart';
import 'package:wallet/features/send_money/data/requests/send_money_request.dart';
import 'package:wallet/features/send_money/data/requests/update_balance_request.dart';
import 'package:wallet/features/send_money/domain/repository/send_money_repository.dart';

import '../../../../core/data_source/remote/api_service_mock.mocks.dart';
import '../../../../core/utils/network_info/network_info_mock.mocks.dart';


void main() {
  late MockApiService api;
  late MockNetworkInfo networkInfo;
  late SendMoneyRepository repository;

  setUpAll(() {
    api = MockApiService();
    networkInfo = MockNetworkInfo();

    repository = SendMoneyRepositoryImpl(api, networkInfo);
  });

  group('sendMoney', () {
    test('should return failure when the device is offline', () async {
      const amount = 1.0;
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => false);

      final result = await repository.sendMoney(amount);

      expect(result.isLeft(), isTrue);
      expect(result, const Left(NetworkFailure()));
    });

    test('should return void on successful send money', () async {
      const amount = 1.0;
      const request = SendMoneyRequest(amount: amount, date: "Aug 02, 2024", time: "11:11 AM");
      const expectedResult = Right(null);
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);
      when(api.sendMoneyService(request)).thenAnswer((_) async => expectedResult);

      final result = await repository.sendMoney(amount);

      expect(result.isRight(), isTrue);
      expect(result, expectedResult);
    });

    test('should return failure on failed send money', () async {
      const amount = 1.0;
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);
      when(api.sendMoneyService(any)).thenThrow(const ServerFailure());

      final result = await repository.sendMoney(amount);

      expect(result.isLeft(), isTrue);
      expect(result, const Left(ServerFailure()));
    });
  });

  group('updateBalance', () {
    test('should return failure when the device is offline', () async {
      const balance = 500.0;
      const amount = 1.0;
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => false);

      final result = await repository.updateBalance(balance, amount);

      expect(result.isLeft(), isTrue);
      expect(result, const Left(NetworkFailure()));
    });

    test('should return void on successful update balance', () async {
      const amount = 1.0;
      const balance = 500.0;
      const newBalance = balance - amount;
      const request = UpdateBalanceRequest(balance: newBalance);
      const expectedResult = Right(null);
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);
      when(api.updateBalanceService(request)).thenAnswer((_) async => expectedResult);

      final result = await repository.updateBalance(balance, amount);

      expect(result.isRight(), isTrue);
      expect(result, expectedResult);
    });

    test('should return failure on failed update balance', () async {
      const amount = 1.0;
      const balance = 500.0;
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);
      when(api.updateBalanceService(any)).thenThrow(const ServerFailure());

      final result = await repository.updateBalance(amount, balance);

      expect(result.isLeft(), isTrue);
      expect(result, const Left(ServerFailure()));
    });
  });

}