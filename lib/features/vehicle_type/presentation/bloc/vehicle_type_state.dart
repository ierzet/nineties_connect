import 'package:nineties_connect/features/vehicle_type/presentation/models/vehicle_type_model.dart';

abstract class VehicleTypeState {}

class VehicleTypeInitial extends VehicleTypeState {}

class VehicleTypeLoaded extends VehicleTypeState {
  final VehicleTypeModel vehicleType;
  VehicleTypeLoaded(this.vehicleType);
}
