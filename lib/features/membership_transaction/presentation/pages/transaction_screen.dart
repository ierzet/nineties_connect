import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/transaction_bloc.dart';
import '../bloc/transaction_event.dart';
import '../bloc/transaction_state.dart';
import '../widgets/transaction_item.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => TransactionBloc()..add(LoadTransactions()),
        child: Column(
          children: [
            // Tab menu bulan
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...["January", "February", "March", "April", "Mei", "Juni", "July"]
                        .map((month) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(month, style: const TextStyle(fontSize: 16)),
                            ))
                        .toList(),
                    // Icon download di ujung tahun
                    IconButton(
                      icon: const Icon(Icons.download, size: 24),
                      onPressed: () {
                        // TODO: Tambahkan aksi untuk download
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),

            // List transaksi
            Expanded(
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionLoaded) {
                    return ListView.builder(
                      itemCount: state.transactions.length + 1,
                      itemBuilder: (context, index) {
                        if (index < state.transactions.length) {
                          return TransactionItem(transaction: state.transactions[index]);
                        }
                        // Pesan akhir daftar
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: Text("Anda telah mencapai akhir transaksi bulan ini")),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
