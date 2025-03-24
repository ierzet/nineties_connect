import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/payment_bloc.dart';
import '../bloc/payment_event.dart';
import '../bloc/payment_state.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Radial Gradient di Background
          Positioned(
            top: -320,
            right: -350,
            child: Container(
              width: 820,
              height: 820,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFFFDD00).withOpacity(0.5),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50, // Menambahkan jarak dari atas
            left: 16,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFFFDD00), width: 2),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      context.go('/main'); // Navigasi kembali
                    },
                  ),
                ),
                const SizedBox(width: 14),
                const Text(
                  "Payment",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 120, // Jarak dari atas
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20), // Sesuaikan padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  BlocBuilder<PaymentBloc, PaymentState>(
                    builder: (context, state) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // posisi bayangan
                            ),
                          ],
                          border: state.selectedPayment == 'Credit Card'
                              ? Border.all(color: const Color(0xFFFFDD00), width: 2)
                              : null,
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          leading: const Icon(Icons.credit_card, size: 40),
                          title: const Text(
                            'Credit Card',
                            style: TextStyle(fontFamily: 'Montserrat', fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(Icons.chevron_right, size: 40),
                          onTap: () {
                            context.read<PaymentBloc>().add(const SelectPaymentMethod('Credit Card'));
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<PaymentBloc, PaymentState>(
                    builder: (context, state) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // posisi bayangan
                            ),
                          ],
                          border: state.selectedPayment == 'Digital Wallet'
                              ? Border.all(color: const Color(0xFFFFDD00), width: 2)
                              : null,
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.account_balance_wallet, size: 60),
                              title: const Text(
                                'Digital Wallet',
                                style: TextStyle(fontFamily: 'Montserrat', fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  context.read<PaymentBloc>().add(const SelectPaymentMethod('Digital Wallet'));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black), // Hanya pinggirannya saja warna hitam
                                  ),
                                  padding: const EdgeInsets.all(8), // Jarak dalam lingkaran
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      const Icon(Icons.add, size: 20, color: Colors.black), // Tanda tambah di tengah
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 2), // Jarak antara ListTile dan tulisan
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(width: 90), // Menambahkan jarak ke kanan
                                Text(
                                  'OVO',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    color: const Color(0xFF8A1B9B), // Warna ungu seperti OVO
                                    fontWeight: FontWeight.bold, // Sedikit tebal
                                  ),
                                ),
                                SizedBox(width: 14), // Jarak antara tulisan
                                Row(
                                  children: [
                                    const Icon(Icons.account_balance_wallet, size: 20, color: Color(0xFF00BFFF)), // Icon dompet
                                    const SizedBox(width: 4), // Jarak antara icon dan teks
                                    Text(
                                      'GoPay',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                        color: const Color(0xFF00BFFF), // Warna biru GoPay
                                        fontWeight: FontWeight.bold, // Sedikit tebal
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 18), // Jarak antara ListTile dan tulisan
                            Container(
                              padding: const EdgeInsets.all(14),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFDD00),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Add your electronic money/ wallet for quick payment',
                                    style: TextStyle(fontFamily: 'Montserrat', color: Colors.black87, fontSize: 12), // Kecilkan ukuran font
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
