import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nineties_connect/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 192,
      height: 48,
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (state.page == 2) {
                // If last page, navigate to authentication
                context.go('/auth');
              } else {
                // Go to next page
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFDD00),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            ),
            child: Text(
              state.page == 0 ? 'Start' : 'Next',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 24 / 16,
                letterSpacing: 0,
                color: Color(0xFF010101),
              ),
            ),
          );
        },
      ),
    );
  }
}
