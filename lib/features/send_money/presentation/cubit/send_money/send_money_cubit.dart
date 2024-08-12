import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet/core/utils/constants.dart';
import 'package:wallet/features/send_money/domain/usecases/send_money_usecase.dart';

part 'send_money_state.dart';
part 'send_money_cubit.freezed.dart';

class SendMoneyCubit extends Cubit<SendMoneyState> {
  final SendMoneyUseCase _sendMoneyUseCase;

  SendMoneyCubit(this._sendMoneyUseCase) : super(const SendMoneyState());

  Future<void> sendClicked(double balance, double amount) async {
    emit(state.copyWith(status: SendMoneyStatus.loading));
    final result = await _sendMoneyUseCase(balance: balance, amountToSend: amount);

    result.fold(
      (error) => emit(state.copyWith(status: SendMoneyStatus.failed, error: error.message)),
      (data) => emit(state.copyWith(status: SendMoneyStatus.success, remainingBalance: data)),
    );
  }

  void amountChanged(String amount) {
    final sanitizedText = amount.replaceAll("₱", "").replaceAll(",", "");
    final amountValue = double.tryParse(sanitizedText) ?? 0.0;
    emit(state.copyWith(amount: amountValue));
  }

  void clearAmount() {
    emit(state.copyWith(amount: 0.0));
  }
}
