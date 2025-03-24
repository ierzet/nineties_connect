import 'package:nineties_connect/features/vehicle_type/presentation/models/vehicle_type_model.dart';

abstract class VehicleTypeEvent {}

class LoadVehicleType extends VehicleTypeEvent {}

class ChangeVehicleType extends VehicleTypeEvent {
  final VehicleType vehicleType;
  ChangeVehicleType(this.vehicleType);
}
