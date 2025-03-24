import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nineties_connect/features/membership_info/presentation/bloc/vehicle_info_bloc.dart';
import 'package:nineties_connect/features/membership_info/presentation/bloc/vehicle_info_event.dart';
import 'package:nineties_connect/features/membership_info/presentation/bloc/vehicle_info_state.dart';
import 'package:nineties_connect/features/vehicle_type/presentation/pages/vehicle_type_screen.dart'; // Tambahkan import ini
import 'package:go_router/go_router.dart';

class VehicleInfoScreen extends StatelessWidget {
  const VehicleInfoScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => VehicleInfoBloc()..add(LoadVehicleInfo()),
        child: BlocBuilder<VehicleInfoBloc, VehicleInfoState>(
          builder: (context, state) {
            if (state is VehicleInfoLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: ListView(
                  children: [
                    _buildVehicleInfoRow(label: 'Year', value: state.year),
                    _buildVehicleInfoRow(label: 'Plate Number', value: state.plateNumber),
                    _buildVehicleInfoRow(label: 'Type', value: state.type),
                    _buildVehicleInfoRow(label: 'Brand', value: state.brand),
                    _buildVehicleInfoRow(label: 'Size', value: state.size),
                    _buildVehicleInfoRow(label: 'Variant', value: state.variant),
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

  Widget _buildVehicleInfoRow({required String label, required String value}) {
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
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black54),
            onPressed: () {
              // context.go('/vehicle-type');
            },
          ),
        ],
      ),
    );
  }
}
