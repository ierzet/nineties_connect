import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:nineties_connect/features/membership/presentation/bloc/membership_bloc.dart';
import 'package:nineties_connect/features/membership/presentation/bloc/membership_event.dart';

class VehicleCard extends StatelessWidget {
  final File? vehicleImage;

  const VehicleCard({super.key, this.vehicleImage});

  Future<void> _pickImage(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      context.read<MembershipBloc>().add(UpdateVehicleImageEvent(File(pickedFile.path)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImage(context),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/car.png', // Ganti dengan gambar yang sesuai
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: GestureDetector(
                  onTap: () => _pickImage(context),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  color: Colors.black.withOpacity(0.5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 🔵 Status Active dengan Icon
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 12),
                          SizedBox(width: 5),
                          Text(
                            "Active",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),

                      // 🚗 Informasi Kendaraan
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "BMW e36 / 323i",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Text(
                            "F 323 EM",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
