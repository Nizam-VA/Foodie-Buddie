part of 'payment_bloc.dart';

class PaymentEvent {}

class PaymentMethodEvent extends PaymentEvent {
  final String method;
  PaymentMethodEvent({required this.method});
}
