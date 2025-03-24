import 'package:flutter_bloc/flutter_bloc.dart';
import 'vehicle_type_event.dart';
import 'vehicle_type_state.dart';
import '../models/vehicle_type_model.dart';

class VehicleTypeBloc extends Bloc<VehicleTypeEvent, VehicleTypeState> {
  VehicleTypeBloc() : super(VehicleTypeInitial()) {
    on<LoadVehicleType>((event, emit) {
      emit(VehicleTypeLoaded(VehicleTypeModel(vehicleType: VehicleType.large)));
    });

    on<ChangeVehicleType>((event, emit) {
      emit(VehicleTypeLoaded(VehicleTypeModel(vehicleType: event.vehicleType)));
    });
  }
}
