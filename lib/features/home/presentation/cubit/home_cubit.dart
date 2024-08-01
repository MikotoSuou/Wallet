import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/repository/home_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;

  HomeCubit(this._repository) : super(const HomeState());

  Future<void> getUser() async {
    emit(state.copyWith(status: HomeStatus.loading));
    final result = await _repository.getUser();
    await Future.delayed(const Duration(seconds: 3));

    result.fold(
      (error) => emit(state.copyWith(status: HomeStatus.failed, error: error.message)),
      (user) => emit(state.copyWith(status: HomeStatus.success, name: user.name, balance: user.balance))
    );
  }

  void toggleClicked() {
    emit(state.copyWith(isToggled: !state.isToggled));
  }
}