import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nineties_connect/features/authentication/presentation/pages/authentication_page.dart';
import 'package:nineties_connect/features/authentication/presentation/pages/signup_page.dart';
import 'package:nineties_connect/features/home/presentation/pages/home_page.dart';
// import 'package:nineties_connect/features/logout/presentation/pages/logout_dialog.dart';
import 'package:nineties_connect/features/main/presentation/pages/main_screen.dart';
import 'package:nineties_connect/features/notifications/presentation/pages/notification_page.dart';
import 'package:nineties_connect/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:nineties_connect/features/onboarding/presentation/pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: MaterialApp.router(
        title: 'Flutter Template',
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
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
      path: '/signup',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/notification',
      builder: (context, state) => const NotificationPage(),
    ),  
    
  ],
);
