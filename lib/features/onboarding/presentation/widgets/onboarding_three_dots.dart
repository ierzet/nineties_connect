import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nineties_connect/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class OnBoardingThreeDots extends StatelessWidget {
  const OnBoardingThreeDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return DotsIndicator(
          dotsCount: 3,
          position: state.page.toDouble(),
          decorator: DotsDecorator(
            color: const Color(0xFFA0A0A0),
            size: const Size.square(9),
            activeColor: Colors.white,
            activeSize: const Size(28, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }
}
