abstract class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentSuccess extends PaymentState {
  final String message;

  PaymentSuccess({required this.message});
}

final class PaymentLoading extends PaymentState {}

class PaymentPriceUpdated extends PaymentState {
  final int nights;
  final double total;

  PaymentPriceUpdated({required this.nights, required this.total});
}

final class PaymentFailure extends PaymentState {
  final String errorMessage;

  PaymentFailure({required this.errorMessage});
}
