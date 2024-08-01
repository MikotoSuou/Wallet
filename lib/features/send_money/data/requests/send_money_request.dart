import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_money_request.g.dart';

@JsonSerializable()
class SendMoneyRequest extends Equatable {
  @JsonKey(name: "amount")
  final double amount;
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "time")
  final String time;

  const SendMoneyRequest({
    required this.amount,
    required this.date,
    required this.time
  });

  factory SendMoneyRequest.fromJson(Map<String, dynamic> json) => _$SendMoneyRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SendMoneyRequestToJson(this);

  @override
  List<Object?> get props => [amount, date, time];
}