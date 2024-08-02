
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/features/send_money/presentation/cubit/send_money/send_money_cubit.dart';

import '../../../domain/usecases/send_money_usecase_mock.mocks.dart';

void main() {
  late MockSendMoneyUseCase sendMoneyUseCase;
  late double balance;
  late SendMoneyCubit cubit;

  setUp(() {
    balance = 1.0;
    sendMoneyUseCase = MockSendMoneyUseCase();
    cubit = SendMoneyCubit(sendMoneyUseCase, balance);
  });

  test("initial state should be SendMoneyState.initial", () {
    expect(cubit.state, const SendMoneyState.initial());
  });

  group("sendClicked", () {
    const balance = 1.0;
    const amount = 1.0;
    
    void setUpMockSendMoneySuccess() => when(sendMoneyUseCase(balance: balance, amountToSend: amount))
        .thenAnswer((_) async => const Right(null));

    blocTest<SendMoneyCubit, SendMoneyState>(
      "should update the state to success state",
      setUp: () => setUpMockSendMoneySuccess(),
      build: () => cubit,
      act: (cubit) => cubit.sendClicked(amount),
      verify: (_) => verify(sendMoneyUseCase(balance: balance, amountToSend: amount)).called(1),
      expect: () => const [
        SendMoneyState.loading(),
        SendMoneyState.success()
      ],
    );

    void setUpMockSendMoneyFailed() => when(sendMoneyUseCase(balance: balance, amountToSend: amount))
        .thenAnswer((_) async => const Left(ServerFailure()));

    blocTest<SendMoneyCubit, SendMoneyState>(
      "should update the state to failed state",
      setUp: () => setUpMockSendMoneyFailed(),
      build: () => cubit,
      act: (cubit) => cubit.sendClicked(amount),
      verify: (_) => verify(sendMoneyUseCase(balance: balance, amountToSend: amount)).called(1),
      expect: () => const [
        SendMoneyState.loading(),
        SendMoneyState.failed("Something went wrong, please try again later")
      ],
    );
  });

  tearDown(() => cubit.close());
}