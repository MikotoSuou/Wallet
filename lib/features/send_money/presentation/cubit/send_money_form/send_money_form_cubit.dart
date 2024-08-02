import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_money_form_state.dart';
part 'send_money_form_cubit.freezed.dart';

class SendMoneyFormCubit extends Cubit<SendMoneyFormState> {
  SendMoneyFormCubit() : super(const SendMoneyFormState());

  void amountChanged(String amount) {
    final sanitizedText = amount.replaceAll("₱", "").replaceAll(",", "");
    final amountValue = double.tryParse(sanitizedText) ?? 0.0;
    emit(state.copyWith(amount: amountValue));
  }

  void clearAmount() {
    emit(const SendMoneyFormState());
  }
}
