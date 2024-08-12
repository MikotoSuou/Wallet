import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:wallet/core/utils/constants.dart';
import 'package:wallet/core/utils/extensions/string_ext.dart';

import '../../domain/entities/transaction.dart';
import '../../domain/usecases/get_transactions_usecase.dart';

part 'transactions_state.dart';
part 'transactions_cubit.freezed.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  final GetTransactionsUseCase _getTransactionsUseCase;

  TransactionsCubit(this._getTransactionsUseCase) : super(const TransactionsState());

  Future<void> getTransactions() async {
    final result = await _getTransactionsUseCase();

    result.fold(
      (error) => emit(state.copyWith(status: TransactionsStatus.failed, error: error.message)),
      (data) {
        if(data.isEmpty) {
          emit(state.copyWith(status: TransactionsStatus.empty));
          return;
        }

        final groupedTransactions = data
            .sorted((transaction1, transaction2) => transaction2.time.toTime.compareTo(transaction1.time.toTime))
            .sorted((transaction1, transaction2) => transaction2.date.toDate.compareTo(transaction1.date.toDate))
            .groupListsBy((transaction) => transaction.date);

        final transactionItems = <TransactionItem>[];
        groupedTransactions.forEach((date, transactions) {
          transactionItems.add(TransactionItem.date(date));
          transactionItems.addAll(transactions.map((transaction) => TransactionItem.transaction(transaction)));
        });

        emit(state.copyWith(status: TransactionsStatus.success, transactionItems: transactionItems));
      },
    );
  }
}
