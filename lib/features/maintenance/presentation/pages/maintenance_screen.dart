
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

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
          Column(
            children: [
              const SizedBox(height: 70),
              Row(
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
                  // const Text(
                  //   "Maintenance",
                  //   style: TextStyle(
                  //     fontFamily: 'Montserrat',
                  //     color: Colors.white,
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 14),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/maintenance.svg', // Ganti dengan ikon yang sesuai
                          width: 400,
                          height: 400,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Mohon bersabar ini ujian',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 80),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFDD00),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              context.go('/main');
                            },
                            child: const Text(
                              'Kembali',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}