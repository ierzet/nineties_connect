import 'package:flutter/material.dart';
import 'package:nineties_connect/core/route/view.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => const LogoutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Mengubah radius menjadi lebih besar
      ),
      child: Container(
        padding: const EdgeInsets.all(5), // Menambah padding
        decoration: BoxDecoration(
          color: const Color(0xFFFFDD00),
          borderRadius: BorderRadius.circular(20), // Mengubah radius menjadi lebih besar
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Ingin Log Out?',
              style: TextStyle(
                fontFamily: 'Montserrat', // Mengganti font menjadi Montserrat
                fontSize: 16, // Mengurangi ukuran font
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), // Mengurangi jarak
            const Text(
              'Pastikan semua aktivitas anda sudah selesai ya, terimakasih sudah mengakses 90s Apps',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat', // Mengganti font menjadi Montserrat
                fontSize: 12, // Mengurangi ukuran font
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15), // Mengurangi jarak
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                TextButton(
                  onPressed: () {
                    context.go('/auth');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6), // Mengurangi padding dan membuat responsif
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15), // Mengubah radius menjadi lebih kecil
                    ),
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        fontFamily: 'Montserrat', // Mengganti font menjadi Montserrat
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Kembali
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6), // Mengurangi padding dan membuat responsif
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFDD00),
                      borderRadius: BorderRadius.circular(15), // Mengubah radius menjadi lebih kecil
                    ),
                    child: const Text(
                      'Kembali',
                      style: TextStyle(
                        fontFamily: 'Montserrat', // Mengganti font menjadi Montserrat
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
