import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nineties_connect/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:nineties_connect/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:nineties_connect/features/onboarding/presentation/widgets/onboarding_page_view.dart';
import 'package:nineties_connect/features/onboarding/presentation/widgets/onboarding_three_dots.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              context.read<OnboardingCubit>().indicatorState(index);
            },
            children: [
              OnboardingPageView(
                page: 0,
                title: 'Selamat Datang di\n 90s Super App',
                subtitle:
                    'Rasakan kemudahan merawat\n kendaraan dalam satu genggaman',
                path: 'assets/svgs/on_boarding_page_1.svg',
              ),
              OnboardingPageView(
                page: 1,
                title: 'Cuci Sepuasnya\n dengan Membership',
                subtitle: 'Daftrakan kendaraanmu agar selalu\n terlindungi',
                path: 'assets/svgs/on_boarding_page_2.svg',
              ),
              OnboardingPageView(
                page: 2,
                title: 'Jadilah yang Pertama',
                subtitle:
                    'Aplikasi otomotif pertama untuk\n pelanggan 90s Autoworks',
                path: 'assets/lotties/ICON-90S0.gif',
              ),
            ],
          ),
          Positioned(bottom: 235, child: OnBoardingThreeDots()),
          Positioned(
            bottom: 175,
            child: OnBoardingButton(pageController: pageController),
          ),
        ],
      ),
    );
  }
}
