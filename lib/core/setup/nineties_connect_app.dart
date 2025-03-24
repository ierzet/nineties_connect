import 'package:flutter/material.dart';
import 'package:nineties_connect/core/setup/app_setup.dart';
import 'package:nineties_connect/core/setup/bloc_provider_setup.dart';

class NinetiesConnectApp extends StatelessWidget {
  const NinetiesConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProviderSetup(child: AppSetup());
  }
}
