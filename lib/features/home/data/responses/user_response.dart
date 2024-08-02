import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/constants.dart';
import '../../domain/entities/user_detail.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends Equatable {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "balance")
  final double? balance;

  const UserResponse({
    required this.id,
    required this.name,
    required this.balance
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  UserDetail get toDomain => UserDetail(
    id: id ?? Constants.emptyString,
    name: name ?? Constants.emptyString,
    balance: balance ?? 0.0,
  );

  @override
  List<Object?> get props => [id, name, balance];
}