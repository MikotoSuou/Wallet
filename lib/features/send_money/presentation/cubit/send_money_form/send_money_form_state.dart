part of 'send_money_form_cubit.dart';

@freezed
class SendMoneyFormState with _$SendMoneyFormState {
  const factory SendMoneyFormState({
    @Default(0.0) double amount,
  }) = _SendMoneyFormState;
}
