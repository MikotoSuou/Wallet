
abstract class Failure {
  final String message;

  const Failure({required this.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = "Please check your internet connection"});
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = "Something went wrong, please try again later"});
}

class InvalidAmountFailure extends Failure {
  const InvalidAmountFailure({super.message = "Please enter an amount to send"});
}

class InsufficientBalanceFailure extends Failure {
  const InsufficientBalanceFailure({super.message = "Insufficient balance"});
}