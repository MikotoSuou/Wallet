part of 'send_money_cubit.dart';

enum SendMoneyStatus { initial, loading, success, failed }

@freezed
class SendMoneyState with _$SendMoneyState {
  const factory SendMoneyState({
    @Default(SendMoneyStatus.initial) SendMoneyStatus status,
    @Default(0.0) double remainingBalance,
    @Default(0.0) double amount,
    @Default(Constants.emptyString) String error,
  }) = _SendMoneyState;
}