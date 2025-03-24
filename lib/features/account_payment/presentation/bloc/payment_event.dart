import 'package:equatable/equatable.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class SelectPaymentMethod extends PaymentEvent {
  final String method;

  const SelectPaymentMethod(this.method);

  @override
  List<Object> get props => [method];
}
