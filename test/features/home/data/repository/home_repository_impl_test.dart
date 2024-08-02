
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/home/data/repository/home_repository_impl.dart';
import 'package:wallet/features/home/data/responses/user_response.dart';
import 'package:wallet/features/home/domain/entities/user_detail.dart';
import 'package:wallet/features/home/domain/repository/home_repository.dart';

import '../../../../core/data_source/remote/api_service_mock.mocks.dart';
import '../../../../core/utils/network_info/network_info_mock.mocks.dart';


void main() {
  late MockApiService api;
  late MockNetworkInfo networkInfo;
  late HomeRepository repository;

  setUpAll(() {
    api = MockApiService();
    networkInfo = MockNetworkInfo();

    repository = HomeRepositoryImpl(api, networkInfo);
  });

  group('getUser', () {
    test('should return failure when the device is offline', () async {
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => false);

      final result = await repository.getUser();

      expect(result.isLeft(), isTrue);
      expect(result, const Left(NetworkFailure()));
    });

    test('should return the correct data on successful get user', () async {
      const response = UserResponse(id: "1", name: "test", balance: 1.0);
      const expectedResult = UserDetail(id: "1", name: "test", balance: 1.0);
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);
      when(api.userService()).thenAnswer((_) async => Future.value(response));

      final result = await repository.getUser();

      expect(result.isRight(), isTrue);
      expect(result, const Right(expectedResult));
    });

    test('should return failure on failed get user', () async {
      when(networkInfo.isNetworkConnected).thenAnswer((_) async => true);
      when(api.userService()).thenThrow(const ServerFailure());

      final result = await repository.getUser();

      expect(result.isLeft(), isTrue);
      expect(result, const Left(ServerFailure()));
    });
  });

}