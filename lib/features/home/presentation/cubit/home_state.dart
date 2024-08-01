part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default('') String name,
    @Default(0.0) double balance,
    @Default(true) bool isToggled,
    @Default('') String error,
  }) = _HomeState;
}

enum HomeStatus { initial, loading, success, failed }