import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit()
      : super(MapState(
          initialPosition: LatLng(-6.2088, 106.8456), // Jakarta
          markers: {
            Marker(
              markerId: MarkerId('outlet1'),
              position: LatLng(-6.209, 106.846),
              infoWindow: InfoWindow(title: '90s Pandu Raya'),
            ),
            Marker(
              markerId: MarkerId('outlet2'),
              position: LatLng(-6.210, 106.843),
              infoWindow: InfoWindow(title: 'Menteng'),
            ),
          },
        ));

  void updateLocation(LatLng newPosition) {
    emit(state.copyWith(initialPosition: newPosition));
  }

  void addMarker(String id, LatLng position, String title) {
    final newMarker = Marker(
      markerId: MarkerId(id),
      position: position,
      infoWindow: InfoWindow(title: title),
    );
    final newMarkers = Set<Marker>.from(state.markers)..add(newMarker);
    emit(state.copyWith(markers: newMarkers));
  }
}
