import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nineties_connect/features/account/presentation/bloc/profile_bloc.dart';
import 'package:nineties_connect/features/account/presentation/bloc/profile_event.dart';
import 'package:nineties_connect/features/account/presentation/bloc/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(LoadProfile()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              top: -320,
              right: -350,
              child: Container(
                width: 820,
                height: 820,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFFFDD00).withOpacity(0.5),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFFFDD00), width: 2),
                        ),
                        margin: const EdgeInsets.only(left: 12),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Text(
                        "My Account",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    padding: const EdgeInsets.all(30),
                    width: double.infinity,
                    height: 700,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: const Offset(0, -110),
                          child: const CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person, size: 100, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 0),
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                Transform.translate(
                                  offset: const Offset(0, -100), // Mengangkat posisi ke atas
                                  child: Text(
                                    state.name,
                                    style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -100), // Mengangkat posisi ke atas
                                  child: Text(
                                    "Joined ${state.joinedDate}",
                                    style: const TextStyle(fontFamily: 'Montserrat'),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Transform.translate(
                                  offset: const Offset(0, -100),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: const Text(
                                          "Personal Information",
                                          style: TextStyle(fontFamily: 'Montserrat'),
                                        ),
                                        trailing: const Icon(Icons.settings),
                                        onTap: () {
                                          context.go('/user');
                                        },
                                      ),
                                      const Divider(color: Colors.black), // Garis hitam di bawah title
                                    ],
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -100),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: const Text(
                                          "Payment Information",
                                          style: TextStyle(fontFamily: 'Montserrat'),
                                        ),
                                        trailing: const Icon(Icons.payment),
                                        onTap: () {
                                          context.go('/payment'); // Mengarahkan ke halaman pembayaran
                                        },
                                      ),
                                      const Divider(color: Colors.black), // Garis hitam di bawah title
                                    ],
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -100),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: const Text(
                                          "FAQ",
                                          style: TextStyle(fontFamily: 'Montserrat'),
                                        ),
                                        trailing: const Icon(Icons.arrow_forward_ios),
                                        onTap: () {
                                          context.go('/faq');
                                        },
                                      ),
                                      const Divider(color: Colors.black), // Garis hitam di bawah title
                                    ],
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -100),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: const Text(
                                          "About",
                                          style: TextStyle(fontFamily: 'Montserrat'),
                                        ),
                                        trailing: const Icon(Icons.arrow_forward_ios),
                                        onTap: () {
                                          context.go('/about');
                                        },
                                      ),
                                      const Divider(color: Colors.black), // Garis hitam di bawah title
                                    ],
                                  ),
                                ),
                               Transform.translate(
                                  offset: const Offset(0, -100),
                                  child: Column(
                                    children: [
                                      SwitchListTile(
                                        title: const Text(
                                          "Biometric Login",
                                          style: TextStyle(fontFamily: 'Montserrat'),
                                        ),
                                        value: state.isBiometricEnabled,
                                        onChanged: (value) {
                                          context.read<ProfileBloc>().add(ToggleBiometric());
                                        },
                                      ),// Menambahkan jarak kecil antara SwitchListTile dan Divider
                                      const SizedBox(height: 4), // Menambahkan jarak kecil di atas Divider
                                      const Divider(color: Colors.black), // Garis hitam di bawah SwitchListTile
                                    ],
                                  ),
                                ), 
                                const SizedBox(height: 0),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
