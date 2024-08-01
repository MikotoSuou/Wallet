part of 'send_money_cubit.dart';

@freezed
class SendMoneyState with _$SendMoneyState {
  const factory SendMoneyState({
    @Default(Status.initial) Status status,
    @Default(0.0) double amount,
    @Default('') String error,
  }) = _SendMoneyState;
}