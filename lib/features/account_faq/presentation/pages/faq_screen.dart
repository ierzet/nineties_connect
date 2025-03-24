import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/faq_cubit.dart';
import '../cubit/faq_state.dart';
import 'package:go_router/go_router.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FAQCubit(),
      child: Scaffold(
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

            // Tombol Back dan Title FAQ
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
                        context.go('/main');
                      },
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    "FAQ",
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

            // Box Putih untuk Konten FAQ
            Positioned(
              top: 120, // Jarak dari atas
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: BlocBuilder<FAQCubit, FAQState>(
                  builder: (context, state) {
                    final faqCubit = context.read<FAQCubit>();

                    List<Map<String, String>> faqList = [
                      {
                        "question": "Bagaimana cara registrasi berdagang?",
                        "answer": "Untuk registrasi berdagang, silakan ikuti langkah berikut:\n\n1. Klik menu Daftar\n2. Pilih opsi Penjual\n3. Lengkapi data diri\n4. Upload dokumen yang diperlukan\n5. Tunggu verifikasi dari tim kami",
                        "date": "Feb 6, 2025"
                      },
                      {
                        "question": "Berapa biaya layanan booking service?",
                        "answer": "Biaya layanan booking bervariasi tergantung jenis layanan:\n\n- Regular: Rp 10.000\n- Premium: Rp 25.000\n- VIP: Rp 50.000",
                        "date": "Feb 11, 2025"
                      },
                      {
                        "question": "Kenapa Pembayaran saya tidak?",
                        "answer": "Jika pembayaran Anda bermasalah, silakan:\n\n1. Periksa koneksi internet\n2. Pastikan saldo mencukupi\n3. Coba metode pembayaran lain\n4. Hubungi customer service",
                        "date": "Feb 15, 2025"
                      },
                      {
                        "question": "Bagaimana cara perpanjang membership?",
                        "answer": "Untuk perpanjang membership:\n\n1. Buka menu Profile\n2. Pilih Membership\n3. Klik Perpanjang\n4. Pilih paket yang diinginkan\n5. Lakukan pembayaran",
                        "date": "Feb 21, 2025"
                      },
                    ];

                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 10), // Menambahkan padding atas
                      itemCount: faqList.length,
                      itemBuilder: (context, index) {
                        bool isSelected = state.selectedIndex == index;

                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                faqList[index]["question"]!,
                                style: const TextStyle(fontFamily: 'Montserrat', fontSize: 16, color: Colors.black),
                              ),
                              trailing: Text(
                                faqList[index]["date"]!,
                                style: const TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                              ),
                              onTap: () {
                                if (isSelected) {
                                  faqCubit.clearSelection();
                                } else {
                                  faqCubit.selectQuestion(index);
                                }
                              },
                            ),
                            if (isSelected)
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  faqList[index]["answer"]!,
                                  style: const TextStyle(fontFamily: 'Montserrat', fontSize: 14, color: Colors.black54),
                                ),
                              ),
                            const Divider(height: 1, color: Colors.grey),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
