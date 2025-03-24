import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nineties_connect/core/route/router.dart';
import 'package:nineties_connect/features/onboarding/presentation/cubit/onboarding_cubit.dart';

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
        routerConfig: createRouter(),
      ),
    );
  }
}
