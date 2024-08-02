import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/transaction.dart';
import '../../domain/usecases/get_transactions_usecase.dart';

part 'transactions_state.dart';
part 'transactions_cubit.freezed.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  final GetTransactionsUseCase _getTransactionsUseCase;

  TransactionsCubit(this._getTransactionsUseCase) : super(const TransactionsState.initial());

  Future<void> getTransactions() async {
    emit(const TransactionsState.loading());

    final result = await _getTransactionsUseCase();

    result.fold(
      (error) => emit(TransactionsState.failed(error.message)),
      (data) => emit(TransactionsState.success(data)),
    );
  }
}
