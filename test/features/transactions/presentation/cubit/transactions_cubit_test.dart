
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/transactions/domain/entities/transaction.dart';
import 'package:wallet/features/transactions/presentation/cubit/transactions_cubit.dart';

import '../../domain/usecases/get_transactions_usecase_mock.mocks.dart';

void main() {
  late MockGetTransactionsUseCase getTransactionsUseCase;
  late TransactionsCubit cubit;

  setUp(() {
    getTransactionsUseCase = MockGetTransactionsUseCase();
    cubit = TransactionsCubit(getTransactionsUseCase);
  });

  test("initial state should be TransactionsState.initial", () {
    expect(cubit.state, const TransactionsState.initial());
  });

  group("getTransactions", () {
    const List<Transaction> transactions = [
      Transaction(id: "1", amount: 1.0, date: "Aug 02, 2024", time: "11:11 AM"),
      Transaction(id: "2", amount: 1.0, date: "Aug 02, 2024", time: "12:12 PM"),
    ];

    const expectedResult = [
      Transaction(id: "2", amount: 1.0, date: "Aug 02, 2024", time: "12:12 PM"),
      Transaction(id: "1", amount: 1.0, date: "Aug 02, 2024", time: "11:11 AM"),
    ];

    void setUpMockGetTransactionsSuccess() => when(getTransactionsUseCase())
        .thenAnswer((_) async => const Right(transactions));

    blocTest<TransactionsCubit, TransactionsState>(
      "should update the state to success state and the list of transactions should be in reversed order",
      setUp: () => setUpMockGetTransactionsSuccess(),
      build: () => cubit,
      act: (cubit) => cubit.getTransactions(),
      verify: (_) => verify(getTransactionsUseCase()).called(1),
      expect: () => const [
        TransactionsState.loading(),
        TransactionsState.success(expectedResult)
      ],
    );

    const List<Transaction> emptyTransactions = [];

    void setUpMockGetTransactionsEmpty() => when(getTransactionsUseCase())
        .thenAnswer((_) async => const Right(emptyTransactions));

    blocTest<TransactionsCubit, TransactionsState>(
      "should update the state to empty state",
      setUp: () => setUpMockGetTransactionsEmpty(),
      build: () => cubit,
      act: (cubit) => cubit.getTransactions(),
      verify: (_) => verify(getTransactionsUseCase()).called(1),
      expect: () => const [
        TransactionsState.loading(),
        TransactionsState.empty()
      ],
    );

    void setUpMockGetTransactionsFailed() => when(getTransactionsUseCase())
        .thenAnswer((_) async => const Left(ServerFailure()));

    blocTest<TransactionsCubit, TransactionsState>(
      "should update the state to failed state",
      setUp: () => setUpMockGetTransactionsFailed(),
      build: () => cubit,
      act: (cubit) => cubit.getTransactions(),
      verify: (_) => verify(getTransactionsUseCase()).called(1),
      expect: () => const [
        TransactionsState.loading(),
        TransactionsState.failed("Something went wrong, please try again later")
      ],
    );
  });

  tearDown(() => cubit.close());
}