import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

abstract class MaintenanceState {}

class MaintenanceInitial extends MaintenanceState {}

class MaintenanceCubit extends Cubit<MaintenanceState> {
  MaintenanceCubit() : super(MaintenanceInitial());

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}