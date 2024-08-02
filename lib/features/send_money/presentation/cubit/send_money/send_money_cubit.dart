import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet/features/send_money/domain/usecases/send_money_usecase.dart';

part 'send_money_state.dart';
part 'send_money_cubit.freezed.dart';

class SendMoneyCubit extends Cubit<SendMoneyState> {
  final SendMoneyUseCase _sendMoneyUseCase;
  final double _balance;

  SendMoneyCubit(this._sendMoneyUseCase, this._balance) : super(const SendMoneyState.initial());

  Future<void> sendClicked(double amount) async {
    emit(const SendMoneyState.loading());
    // await Future.delayed(const Duration(seconds: 3));
    final result = await _sendMoneyUseCase(balance: _balance, amountToSend: amount);

    result.fold(
      (error) => emit(SendMoneyState.failed(error.message)),
      (success) => emit(const SendMoneyState.success()),
    );
  }
}
