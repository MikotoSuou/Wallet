
import 'package:wallet/core/utils/constants.dart';
import 'package:wallet/features/home/data/responses/user_response.dart';
import 'package:wallet/features/home/domain/entities/User.dart';

extension UserResponseMapper on UserResponse? {
  User get toDomain => User(
    id: this?.id ?? Constants.emptyString,
    name: this?.name ?? Constants.emptyString,
    balance: this?.balance ?? 0.0,
  );
}