part of 'transactions_cubit.dart';

enum TransactionsStatus { loading, empty, success, failed }

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    @Default(TransactionsStatus.loading) TransactionsStatus status,
    @Default(<TransactionItem>[]) List<TransactionItem> transactionItems,
    @Default(Constants.emptyString) String error,
  }) = _TransactionState;
}

@freezed
class TransactionItem with _$TransactionItem {
  const factory TransactionItem.date(String date) = _Date;
  const factory TransactionItem.transaction(Transaction transaction) = _Transaction;
}