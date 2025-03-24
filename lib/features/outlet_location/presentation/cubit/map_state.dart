part of 'map_cubit.dart';

@immutable
class MapState {
  final LatLng initialPosition;
  final Set<Marker> markers;

  MapState({required this.initialPosition, required this.markers});

  MapState copyWith({LatLng? initialPosition, Set<Marker>? markers}) {
    return MapState(
      initialPosition: initialPosition ?? this.initialPosition,
      markers: markers ?? this.markers,
    );
  }
}
