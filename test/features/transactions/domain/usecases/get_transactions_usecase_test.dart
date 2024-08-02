import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/transactions/domain/entities/transaction.dart';
import 'package:wallet/features/transactions/domain/usecases/get_transactions_usecase.dart';
import '../repository/transaction_repository_mock.mocks.dart';

void main() {
  late MockTransactionRepository repository;
  late GetTransactionsUseCase getTransactionsUseCase;

  setUp(() {
    repository = MockTransactionRepository();
    getTransactionsUseCase = GetTransactionsUseCase(repository);
  });

  test('should return transactions from the repository when successful', () async {
    const List<Transaction> transactions = [
      Transaction(id: "1", amount: 1.0, date: "Aug 02, 2024", time: "11:11 AM"),
      Transaction(id: "2", amount: 1.0, date: "Aug 02, 2024", time: "12:12 PM"),
    ];
    when(repository.getTransactions()).thenAnswer((_) async => const Right(transactions));

    final result = await getTransactionsUseCase();

    expect(result, const Right(transactions));
    verify(repository.getTransactions()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return failure from the repository when failed', () async {
    const expectedResult = ServerFailure();
    when(repository.getTransactions()).thenAnswer((_) async => const Left(expectedResult));

    final result = await getTransactionsUseCase();

    expect(result, const Left(expectedResult));
    verify(repository.getTransactions()).called(1);
    verifyNoMoreInteractions(repository);
  });
}