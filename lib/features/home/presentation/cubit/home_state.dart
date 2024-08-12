part of 'home_cubit.dart';

enum HomeStatus { loading, success, failed }

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.loading) HomeStatus status,
    @Default(Strings.hello) String name,
    @Default(0.0) double balance,
    @Default(true) bool isToggled,
    @Default('') String error,
  }) = _HomeState;
}