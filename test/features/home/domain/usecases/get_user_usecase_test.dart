import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/home/domain/entities/user_detail.dart';
import 'package:wallet/features/home/domain/usecases/get_user_usecase.dart';
import '../repository/home_repository_mock.mocks.dart';

void main() {
  late MockHomeRepository repository;
  late GetUserUseCase getUserUseCase;

  setUp(() {
    repository = MockHomeRepository();
    getUserUseCase = GetUserUseCase(repository);
  });

  test('should return user detail from the repository when successful', () async {
    const expectedResult = UserDetail(id: "1", name: "test", balance: 1.0);
    when(repository.getUser()).thenAnswer((_) async => const Right(expectedResult));

    final result = await getUserUseCase();

    expect(result, const Right(expectedResult));
    verify(repository.getUser()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return failure from the repository when failed', () async {
    const expectedResult = ServerFailure();
    when(repository.getUser()).thenAnswer((_) async => const Left(expectedResult));

    final result = await getUserUseCase();

    expect(result, const Left(expectedResult));
    verify(repository.getUser()).called(1);
    verifyNoMoreInteractions(repository);
  });
}