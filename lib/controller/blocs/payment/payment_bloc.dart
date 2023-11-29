import 'package:bloc/bloc.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentMethodEvent>((event, emit) {
      emit(PaymentState(method: event.method));
    });
  }
}
