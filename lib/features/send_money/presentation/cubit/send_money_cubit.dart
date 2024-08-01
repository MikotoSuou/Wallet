import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet/core/utils/enums.dart';

part 'send_money_state.dart';
part 'send_money_cubit.freezed.dart';

class SendMoneyCubit extends Cubit<SendMoneyState> {
  SendMoneyCubit() : super(const SendMoneyState());

  void amountChanged(String amount) {
    final sanitizedText = amount.replaceAll("₱", "").replaceAll(",", "");
    final amountValue = double.tryParse(sanitizedText) ?? 0.0;
    emit(state.copyWith(amount: amountValue));
  }
}
