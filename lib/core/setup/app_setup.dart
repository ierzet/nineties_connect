import 'package:flutter/material.dart';
import 'package:nineties_connect/core/route/router.dart';

class AppSetup extends StatelessWidget {
  const AppSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Template',
      routerConfig: createRouter(),
    );
  }
}
