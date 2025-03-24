import 'package:equatable/equatable.dart';

abstract class VehicleInfoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadVehicleInfo extends VehicleInfoEvent {}
