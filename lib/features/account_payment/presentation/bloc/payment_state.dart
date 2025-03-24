import 'package:equatable/equatable.dart';

class PaymentState extends Equatable {
  final String selectedPayment;

  const PaymentState({required this.selectedPayment});

  @override
  List<Object> get props => [selectedPayment];
}
