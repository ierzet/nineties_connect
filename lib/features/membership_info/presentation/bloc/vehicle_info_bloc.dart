import 'package:flutter_bloc/flutter_bloc.dart';
import 'vehicle_info_event.dart';
import 'vehicle_info_state.dart';

class VehicleInfoBloc extends Bloc<VehicleInfoEvent, VehicleInfoState> {
  VehicleInfoBloc() : super(VehicleInfoInitial()) {
    on<LoadVehicleInfo>((event, emit) {
      emit(const VehicleInfoLoaded(
        year: '1997',
        plateNumber: 'F 323 EM',
        type: 'e36 / 323 i',
        brand: 'BMW',
        size: 'Medium',
        variant: 'Yellow',
      ));
    });
  }
}
