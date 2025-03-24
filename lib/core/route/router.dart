

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nineties_connect/features/account/presentation/pages/profile_screen.dart';
import 'package:nineties_connect/features/account_payment/presentation/bloc/payment_bloc.dart';
import 'package:nineties_connect/features/account_payment/presentation/pages/payment_screen.dart';
import 'package:nineties_connect/features/authentication/presentation/pages/authentication_page.dart';
import 'package:nineties_connect/features/gallery/presentation/pages/gallery_screen.dart';
import 'package:nineties_connect/features/home/presentation/pages/home_page.dart';
import 'package:nineties_connect/features/membership/presentation/pages/membership_screen.dart';
import 'package:nineties_connect/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:nineties_connect/features/onboarding/presentation/pages/onboarding_page.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => BlocProvider(
          create: (_) => OnboardingCubit(),
          child: const OnBoardingPage(),
        ),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthenticationPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/payment',
        builder: (context, state) => BlocProvider(
          create: (context) => PaymentBloc(),
          child: const PaymentScreen(),
        ),
      ),
      GoRoute(
        path: '/membership',
        builder: (context, state) => const MembershipScreen(),
      ),
      GoRoute(
        path: '/gallery',
        builder: (context, state) => const GalleryScreen(),
      ),
    ],
  );
}