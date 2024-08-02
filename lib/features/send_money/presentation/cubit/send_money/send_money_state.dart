part of 'send_money_cubit.dart';

@freezed
class SendMoneyState with _$SendMoneyState {
  const factory SendMoneyState.initial() = _Initial;
  const factory SendMoneyState.loading() = _Loading;
  const factory SendMoneyState.success() = _Success;
  const factory SendMoneyState.failed(String error) = _Failed;
}