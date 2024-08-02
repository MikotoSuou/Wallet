import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wallet/features/transactions/domain/entities/transaction.dart';

import '../../../../core/utils/constants.dart';

part 'transaction_response.g.dart';

@JsonSerializable()
class TransactionResponse extends Equatable {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "amount")
  final double? amount;
  @JsonKey(name: "date")
  final String? date;
  @JsonKey(name: "time")
  final String? time;

  const TransactionResponse({
    required this.id,
    required this.amount,
    required this.date,
    required this.time,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) => _$TransactionResponseFromJson(json);

  Transaction toDomain() => Transaction(
    id: id ?? Constants.emptyString,
    amount: amount ?? 0.0,
    date: date ?? Constants.emptyString,
    time: time ?? Constants.emptyString,
  );

  @override
  List<Object?> get props => [id, amount, date, time];
}