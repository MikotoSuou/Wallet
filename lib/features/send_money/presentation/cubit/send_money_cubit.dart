import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet/core/utils/enums.dart';
import 'package:wallet/features/send_money/domain/usecases/send_money_usecase.dart';

part 'send_money_state.dart';
part 'send_money_cubit.freezed.dart';

class SendMoneyCubit extends Cubit<SendMoneyState> {
  final SendMoneyUseCase _sendMoneyUseCase;
  final double _balance;

  SendMoneyCubit(this._sendMoneyUseCase, this._balance) : super(const SendMoneyState());

  void amountChanged(String amount) {
    final sanitizedText = amount.replaceAll("₱", "").replaceAll(",", "");
    final amountValue = double.tryParse(sanitizedText) ?? 0.0;
    emit(state.copyWith(amount: amountValue));
  }

  Future<void> sendClicked() async {
    emit(state.copyWith(status: Status.loading));
    // await Future.delayed(const Duration(seconds: 3));
    final result = await _sendMoneyUseCase(balance: _balance, amountToSend: state.amount);

    result.fold(
      (error) => { print("BJTEST :: ${error.message}") },
      (success) => { print("BJTEST :: success") },
    );
  }
}
