import '../models/transaction_model.dart';

abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<TransactionModel> transactions;

  TransactionLoaded(this.transactions);
}
