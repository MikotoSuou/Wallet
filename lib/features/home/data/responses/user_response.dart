import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
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

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}