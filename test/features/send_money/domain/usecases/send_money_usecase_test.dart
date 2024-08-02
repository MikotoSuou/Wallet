import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/home/domain/entities/user_detail.dart';
import 'package:wallet/features/send_money/domain/usecases/send_money_usecase.dart';
import '../repository/send_money_repository_mock.mocks.dart';

void main() {
  late MockSendMoneyRepository repository;
  late SendMoneyUseCase sendMoneyUseCase;

  setUp(() {
    repository = MockSendMoneyRepository();
    sendMoneyUseCase = SendMoneyUseCase(repository);
  });

  test('should return InvalidAmountFailure when amountToSend is zero', () async {
    const balance = 500.0;
    const amount = 0.0;
    const expectedResult = InvalidAmountFailure();

    final result = await sendMoneyUseCase(
      balance: balance,
      amountToSend: amount
    );

    expect(result, const Left(expectedResult));
  });

  test('should return InsufficientBalanceFailure when amountToSend is greater than the available balance', () async {
    const balance = 500.0;
    const amount = 600.0;
    const expectedResult = InsufficientBalanceFailure();

    final result = await sendMoneyUseCase(
      balance: balance,
      amountToSend: amount,
    );

    expect(result, const Left(expectedResult));
  });

  test('should return failure from repository when sendMoney fails', () async {
    const balance = 500.0;
    const amount = 300.0;
    when(repository.sendMoney(amount))
        .thenAnswer((_) async => const Left(ServerFailure()));

    final result = await sendMoneyUseCase(
      balance: balance,
      amountToSend: amount,
    );

    expect(result, const Left(ServerFailure()));
    verify(repository.sendMoney(amount)).called(1);
    verifyNoMoreInteractions(repository);
  });


  test('should return void when sendMoney succeeds and balance is updated', () async {
    const balance = 100.0;
    const amount = 50.0;
    when(repository.sendMoney(amount))
        .thenAnswer((_) async => const Right<Failure, void>(null));
    when(repository.updateBalance(balance, amount))
        .thenAnswer((_) async => const Right<Failure, void>(null));

    final result = await sendMoneyUseCase(
      balance: balance,
      amountToSend: amount,
    );

    expect(result, const Right<Failure, void>(null));
    verify(repository.sendMoney(amount)).called(1);
    verify(repository.updateBalance(balance, amount)).called(1);
    verifyNoMoreInteractions(repository);
  });
}