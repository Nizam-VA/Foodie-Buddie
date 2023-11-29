part of 'payment_bloc.dart';

class PaymentState {
  final String method;
  PaymentState({required this.method});
}

final class PaymentInitial extends PaymentState {
  PaymentInitial() : super(method: '');
}
