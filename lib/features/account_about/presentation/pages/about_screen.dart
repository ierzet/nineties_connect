import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nineties_connect/features/account_about/presentation/cubit/about_cubit.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
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
                        context.go('/main');
                      },
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    "About",
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
            Column(
              children: [
                const SizedBox(height: 110), // Menambahkan jarak dengan yang atasnya
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 110, // Menghindari overflow dengan menyesuaikan tinggi
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/LOGO 90S.svg',
                        height: 50,
                      ),
                      const SizedBox(height: 10),
                      _infoRow("Version", "1.0.0", "Update"),
                      const Divider(color: Colors.black), // Garis hitam di bawah version
                      _infoRow("Call Center 90s", "", "Call", icon: Icons.call),
                      const Divider(color: Colors.black), // Garis hitam di bawah call center
                      const SizedBox(height: 10), // Menambahkan jarak sebelum teks
                      const Text(
                        "90s Autoworks All Rights Reserved.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                // Jarak antara kotak dan bagian bawah
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value, String buttonLabel, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          if (value.isNotEmpty) Text(value, style: const TextStyle(fontSize: 16)),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            icon: icon != null ? Icon(icon, color: Colors.black) : const SizedBox(),
            label: Text(
              buttonLabel,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
