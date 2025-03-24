import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Tambahkan logika ketika tombol ditekan
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Submit clicked!"))
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFDD00), // Ganti warna tombol
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          "Submit",
          style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'Montserrat' ),
        ),
      ),
    );
  }
}
