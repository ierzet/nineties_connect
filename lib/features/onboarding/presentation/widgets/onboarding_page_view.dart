import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPageView extends StatelessWidget {
  final int page;
  final String title;
  final String subtitle;
  final String svgPath;

  const OnboardingPageView({
    super.key,
    required this.page,
    required this.title,
    required this.subtitle,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: -400,
            left: -450,
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
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    svgPath,
                    width: 375,
                    height: 451,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 40 / 28,
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 24 / 16,
                      letterSpacing: 0,
                      color: Color(0xFFA0A0A0),
                    ),
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
