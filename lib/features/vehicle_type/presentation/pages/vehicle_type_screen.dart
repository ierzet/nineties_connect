import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/vehicle_type_bloc.dart';
import '../bloc/vehicle_type_event.dart';
import '../bloc/vehicle_type_state.dart';
import '../models/vehicle_type_model.dart';

class VehicleTypeScreen extends StatelessWidget {
  const VehicleTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => VehicleTypeBloc()..add(LoadVehicleType()),
        child: BlocBuilder<VehicleTypeBloc, VehicleTypeState>(
          builder: (context, state) {
            if (state is VehicleTypeLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _vehicleTypeToString(state.vehicleType.vehicleType),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildVehicleTypeSelector(context, state.vehicleType.vehicleType),
                  const Spacer(),
                  _buildBottomNavigationBar(),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildVehicleTypeSelector(BuildContext context, VehicleType selectedType) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: VehicleType.values.map((type) {
          return ChoiceChip(
            label: Text(_vehicleTypeToString(type)),
            selected: selectedType == type,
            onSelected: (bool selected) {
              if (selected) {
                context.read<VehicleTypeBloc>().add(ChangeVehicleType(type));
              }
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Membership"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Account"),
        ],
      ),
    );
  }

  String _vehicleTypeToString(VehicleType type) {
    switch (type) {
      case VehicleType.large:
        return "Large";
      case VehicleType.medium:
        return "Medium";
      case VehicleType.small:
        return "Small";
      default:
        return "";
    }
  }
}
