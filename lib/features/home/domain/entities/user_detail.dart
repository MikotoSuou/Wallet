
import 'package:equatable/equatable.dart';

class UserDetail extends Equatable {
  final String id;
  final String name;
  final double balance;

  const UserDetail({
    required this.id,
    required this.name,
    required this.balance
  });

  @override
  List<Object?> get props => [id, name, balance];
}