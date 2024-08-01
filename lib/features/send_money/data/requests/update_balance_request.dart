import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_balance_request.g.dart';

@JsonSerializable()
class UpdateBalanceRequest extends Equatable {
  @JsonKey(name: "balance")
  final double balance;

  const UpdateBalanceRequest({
    required this.balance,
  });

  factory UpdateBalanceRequest.fromJson(Map<String, dynamic> json) => _$UpdateBalanceRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateBalanceRequestToJson(this);

  @override
  List<Object?> get props => [balance];
}