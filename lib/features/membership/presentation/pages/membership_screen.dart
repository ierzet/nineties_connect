import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nineties_connect/features/membership/presentation/bloc/membership_bloc.dart';
import 'package:nineties_connect/features/membership/presentation/bloc/membership_state.dart';
import 'package:nineties_connect/features/membership/presentation/widgets/submit_button.dart';
import 'package:nineties_connect/features/membership/presentation/widgets/vehicle_card.dart';
import 'package:nineties_connect/features/membership_info/presentation/pages/vehicle_info_screen.dart';
import 'package:nineties_connect/features/membership_informasion/presentation/pages/membership_info_screen.dart';
import 'package:nineties_connect/features/membership_qr_code/presentation/pages/qr_code_screen.dart';
import 'package:nineties_connect/features/membership_transaction/presentation/pages/transaction_screen.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MembershipBloc(),
      child: const MembershipView(),
    );
  }
}

class MembershipView extends StatelessWidget {
  const MembershipView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Jumlah tab diperbarui menjadi 4
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
                      Color(0xFFFFDD00).withOpacity(0.5),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 50),
                _buildHeader(context),
                const SizedBox(height: 20),
                SizedBox(
                  height: 160,
                  child: PageView(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/gallery');
                        },
                        child: BlocBuilder<MembershipBloc, MembershipState>(
                          builder: (context, state) {
                            return VehicleCard(vehicleImage: state.vehicleImage);
                          },
                        ),
                      ),
                      _buildAddPhotosCard(context),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    child: Column(
                      children: [
                        _buildTabBar(),
                        const SizedBox(height: 20),
                        Expanded(
                          child: TabBarView(
                            children: [
                              const VehicleInfoScreen(),
                              const MembershipInfoScreen(),
                              const QrCodeScreen(),
                              const TransactionScreen(),
                            ],
                          ),
                        ),
                        const SubmitButton(),
                      ],
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

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFFFFDD00), width: 2),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(width: 14),
        const Text(
          "Membership",
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return const TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      labelStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
      indicatorColor: Colors.yellow,
      tabs: [
        Tab(text: "Vehicle Information"),
        Tab(text: "Membership Information"),
        Tab(text: "QR Code"),
        Tab(text: "Transaction"),
      ],
    );
  }

  Widget _buildAddPhotosCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/gallery');
      },
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: const Color(0xFFFFDD00),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(10), // Padding untuk lingkaran
              child: const Icon(Icons.add, size: 30, color: Colors.white),
            ),
            const SizedBox(height: 5),
            const Text("Add", style: TextStyle(fontFamily: 'Montserrat', color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
