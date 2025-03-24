import 'package:flutter/material.dart';
import 'package:nineties_connect/core/route/view.dart';

class BlocProviderSetup extends StatelessWidget {
  final Widget child;

  const BlocProviderSetup({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => OnboardingCubit())],
      child: child,
    );
  }
}
