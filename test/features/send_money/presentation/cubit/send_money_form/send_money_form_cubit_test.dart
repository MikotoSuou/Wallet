
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:wallet/features/send_money/presentation/cubit/send_money_form/send_money_form_cubit.dart';


void main() {
  late SendMoneyFormCubit cubit;

  setUp(() {
    cubit = SendMoneyFormCubit();
  });

  test("initial state should be SendMoneyFormState with default values", () {
    expect(cubit.state, const SendMoneyFormState());
  });

  group("amountChanged", () {
    blocTest<SendMoneyFormCubit, SendMoneyFormState>(
      'should update the state when amountChanged is called',
      build: () => cubit,
      act: (cubit) => cubit.amountChanged('₱1,234.56'),
      expect: () => [
        const SendMoneyFormState(amount: 1234.56),
      ],
    );
  });

  group("clearAmount", () {
    blocTest<SendMoneyFormCubit, SendMoneyFormState>(
      'should update the state to the default state',
      build: () => cubit,
      act: (cubit) => cubit.clearAmount(),
      expect: () => [
        const SendMoneyFormState(),
      ],
    );
  });

  tearDown(() => cubit.close());
}