import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/qr_code_bloc.dart';
import '../bloc/qr_code_event.dart';
import '../bloc/qr_code_state.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: BlocProvider(
          create: (context) => QrCodeBloc()..add(LoadQrCode()),
          child: BlocBuilder<QrCodeBloc, QrCodeState>(
            builder: (context, state) {
              if (state is QrCodeLoaded) {
                return Image.asset(
                  state.qrCodePath,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
