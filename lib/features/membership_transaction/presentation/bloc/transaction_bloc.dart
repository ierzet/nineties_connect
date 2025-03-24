import 'package:flutter_bloc/flutter_bloc.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';
import '../models/transaction_model.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<LoadTransactions>((event, emit) {
      final transactions = [
        TransactionModel(location: "Pandu Raya", date: "Feb 3, 2025"),
        TransactionModel(location: "Dramaga", date: "Feb 6, 2025"),
        TransactionModel(location: "Cilendek", date: "Feb 11, 2025"),
        TransactionModel(location: "Cilendek", date: "Feb 13, 2025"),
        TransactionModel(location: "Pandu Raya", date: "Feb 17, 2025"),
        TransactionModel(location: "Pandu Raya", date: "Feb 18, 2025"),
        TransactionModel(location: "Pandu Raya", date: "Feb 19, 2025"),
      ];

      emit(TransactionLoaded(transactions));
    });
  }
}
