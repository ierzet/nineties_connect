import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nineties_connect/features/membership_informasion/presentation/bloc/membership_info_bloc.dart';
import 'package:nineties_connect/features/membership_informasion/presentation/bloc/membership_info_event.dart';
import 'package:nineties_connect/features/membership_informasion/presentation/bloc/membership_info_state.dart';

class MembershipInfoScreen extends StatelessWidget {
  const MembershipInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => MembershipInfoBloc()..add(LoadMembershipInfo()),
        child: BlocBuilder<MembershipInfoBloc, MembershipInfoState>(
          builder: (context, state) {
            if (state is MembershipInfoLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: ListView(
                  children: [
                    MembershipInfoItem(label: 'Vehicle Type', value: state.vehicleType),
                    MembershipInfoItem(label: 'Registration', value: state.registrationDate),
                    MembershipInfoItem(label: 'Renewal', value: state.extendDate, showSettings: true),
                    MembershipInfoItem(label: 'Expiration', value: state.expiredDate),
                    MembershipInfoItem(label: 'Status', value: state.status),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class MembershipInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final bool showSettings;

  const MembershipInfoItem({
    Key? key,
    required this.label,
    required this.value,
    this.showSettings = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14, // Menyesuaikan ukuran font agar sejajar
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                if (showSettings)
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.black54),
                    onPressed: () {
                      // TODO: Tambahkan aksi saat ikon settings ditekan
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
