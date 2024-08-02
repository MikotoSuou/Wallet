import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String id;
  final double amount;
  final String date;
  final String time;

  const Transaction({
    required this.id,
    required this.amount,
    required this.date,
    required this.time,
  });

  @override
  List<Object?> get props => [id, amount, date, time];
}