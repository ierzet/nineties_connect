import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/logout_cubit.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => BlocProvider(
        create: (_) => LogoutCubit(),
        child: const LogoutDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
            context.go('/auth');
        }
      },
      builder: (context, state) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Ingin Log Out?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Pastikan semua aktivitas anda sudah selesai ya, terimakasih sudah mengakses 90s Apps',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.go('/main');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Kembali',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: state is LogoutLoading
                          ? null
                          : () => context.read<LogoutCubit>().logout(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFDD00),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: state is LogoutLoading
                            ? const CircularProgressIndicator(color: Colors.black)
                            : const Text(
                                'Log Out',
                                style: TextStyle(color: Colors.black87),
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
