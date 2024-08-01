
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wallet/core/error/failure.dart';
import 'package:wallet/core/utils/constants.dart';
import 'package:wallet/features/home/domain/entities/user_detail.dart';
import 'package:wallet/features/home/presentation/cubit/home_cubit.dart';

import '../../domain/repository/home_repository_mock.mocks.dart';

void main() {
  late MockHomeRepository repository;
  late HomeCubit cubit;

  setUp(() {
    repository = MockHomeRepository();
    cubit = HomeCubit(repository);
  });

  test("initial state should be HomeStatus.initial", () {
    expect(cubit.state.status, HomeStatus.initial);
  });

  group("getUser", () {
    const userDetail = UserDetail(id: "1", name: "test", balance: 1.0);
    void setUpMockGetUserSuccess() => when(repository.getUser())
        .thenAnswer((_) async => const Right(userDetail));

    blocTest<HomeCubit, HomeState>(
      "should update the state to success state",
      setUp: () => setUpMockGetUserSuccess(),
      build: () => cubit,
      act: (cubit) => cubit.getUser(),
      verify: (_) => verify(repository.getUser()).called(1),
      expect: () => [
        const HomeState(
          status: HomeStatus.loading,
          name: Constants.emptyString,
          balance: 0.0,
          isToggled: true,
          error: Constants.emptyString,
        ),

        const HomeState(
          status: HomeStatus.success,
          name: "test",
          balance: 1.0,
          isToggled: true,
          error: Constants.emptyString
        )
      ]
    );

    void setUpMockGetUserFailed() => when(repository.getUser())
        .thenAnswer((_) async => const Left(ServerFailure()));

    blocTest<HomeCubit, HomeState>(
      "should update the state to failed state",
      setUp: () => setUpMockGetUserFailed(),
      build: () => cubit,
      act: (cubit) => cubit.getUser(),
      verify: (_) => verify(repository.getUser()).called(1),
      expect: () => [
        const HomeState(
          status: HomeStatus.loading,
          name: Constants.emptyString,
          balance: 0.0,
          isToggled: true,
          error: Constants.emptyString,
        ),

        const HomeState(
          status: HomeStatus.failed,
          name: Constants.emptyString,
          balance: 0.0,
          isToggled: true,
          error: "Something went wrong, please try again later",
        ),
      ]
    );
  });

  group("toggleClicked", () {
    blocTest<HomeCubit, HomeState>(
      "should update the isToggled state",
      build: () => cubit,
      act: (cubit) => cubit.toggleClicked(),
      expect: () => [
        const HomeState(
          status: HomeStatus.initial,
          name: Constants.emptyString,
          balance: 0.0,
          isToggled: false,
          error: Constants.emptyString,
        ),
      ]
    );
  });

  tearDown(() => cubit.close());
}