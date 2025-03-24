import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../cubit/detail_cubit.dart';
import '../cubit/detail_state.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  static Future<void> show(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => DetailCubit(),
          child: const DetailScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          return Stack(
            children: [
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
                        Color(0xFFFFDD00).withOpacity(0.5),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 70),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFFFFDD00), width: 2),
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
                        "Detail",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/LOGO 90S.svg',
                        height: 50,
                      ),
                      Icon(
                        Icons.check_circle, // Ganti dengan icon yang sesuai
                        color: Color(0xFF00FF00), // Warna hijau terang
                        size: 150, // Ukuran icon
                      ),
                      const SizedBox(height: 5),
                      Text(
                        state.title,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        state.date,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.price,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ...state.details.entries.map((entry) => _buildDetailItem(entry.key, entry.value)).toList(),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIconButton(Icons.share, Colors.black, () {
                            // Tambahkan logika berbagi
                          }),
                          const SizedBox(width: 20),
                          _buildIconButton(Icons.download, Colors.black, () {
                            // Tambahkan logika unduh
                          }),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                          context.go('/main');
                        }, // Mengarah ke main
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFDD00),
                              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 18),
                            ),
                            child: const Text('Done', style: TextStyle(fontFamily: 'Montserrat', color: Colors.black)), // Mengubah teks menjadi 'Selesai'
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontFamily: 'Montserrat', color: Colors.black, fontSize: 16),
          ),
          SizedBox(
            width: 200, // Atur lebar sesuai kebutuhan
            child: Text(
              value,
              textAlign: TextAlign.left, // Mengubah rata kiri
              style: const TextStyle(fontFamily: 'Montserrat', color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2),
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }
}
