import 'package:equatable/equatable.dart';

class VehicleInfoState extends Equatable {
  final String year;
  final String plateNumber;
  final String type;
  final String brand;
  final String size;
  final String variant;

  const VehicleInfoState({
    required this.year,
    required this.plateNumber,
    required this.type,
    required this.brand,
    required this.size,
    required this.variant,
  });

  @override
  List<Object> get props => [year, plateNumber, type, brand, size, variant];
}

class VehicleInfoInitial extends VehicleInfoState {
  VehicleInfoInitial()
      : super(
          year: '',
          plateNumber: '',
          type: '',
          brand: '',
          size: '',
          variant: '',
        );
}

class VehicleInfoLoaded extends VehicleInfoState {
  const VehicleInfoLoaded({
    required super.year,
    required super.plateNumber,
    required super.type,
    required super.brand,
    required super.size,
    required super.variant,
  });
}
