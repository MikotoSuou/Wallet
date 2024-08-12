import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet/features/home/domain/usecases/get_user_usecase.dart';
import 'package:wallet/features/send_money/domain/repository/send_money_repository.dart';
import 'package:wallet/res/strings.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetUserUseCase _getUser;

  HomeCubit(this._getUser) : super(const HomeState());

  Future<void> getUser() async {
    final result = await _getUser();

    result.fold(
      (error) => emit(state.copyWith(status: HomeStatus.failed, error: error.message)),
      (user) => emit(state.copyWith(status: HomeStatus.success, name: "@${user.name}", balance: user.balance))
    );
  }

  void toggleClicked() {
    emit(state.copyWith(isToggled: !state.isToggled));
  }

  void updateBalance(UpdatedBalance balance) {
    emit(state.copyWith(balance: balance));
  }
}
