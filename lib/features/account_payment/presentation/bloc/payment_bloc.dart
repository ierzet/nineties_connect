import 'package:flutter_bloc/flutter_bloc.dart';
import 'payment_event.dart';
import 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState(selectedPayment: '')) {
    on<SelectPaymentMethod>((event, emit) {
      emit(PaymentState(selectedPayment: event.method));
    });
  }
}
