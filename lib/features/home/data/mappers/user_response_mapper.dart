
import 'package:wallet/core/utils/constants.dart';
import 'package:wallet/features/home/data/responses/user_response.dart';
import 'package:wallet/features/home/domain/entities/user_detail.dart';

extension UserResponseMapper on UserResponse? {
  UserDetail get toDomain => UserDetail(
    id: this?.id ?? Constants.emptyString,
    name: this?.name ?? Constants.emptyString,
    balance: this?.balance ?? 0.0,
  );
}