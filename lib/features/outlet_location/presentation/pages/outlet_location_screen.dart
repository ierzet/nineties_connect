import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../cubit/map_cubit.dart';

class OutletLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<MapCubit, MapState>(
              builder: (context, state) {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: state.initialPosition,
                    zoom: 14.0,
                  ),
                  markers: state.markers,
                  onMapCreated: (GoogleMapController controller) {},
                );
              },
            ),
            Positioned(
              top: 40,
              left: 16,
              right: 16,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search 90s Outlet",
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 150,
              left: 50,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('90s Pandu Raya', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Positioned(
              top: 250,
              left: 20,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Menteng', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 40,
              right: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  // Tambahkan aksi tombol
                },
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
