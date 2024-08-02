part of 'transactions_cubit.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.initial() = _Initial;
  const factory TransactionsState.loading() = _Loading;
  const factory TransactionsState.success(List<Transaction> transactions) = _Success;
  const factory TransactionsState.failed(String error) = _Failed;
}
