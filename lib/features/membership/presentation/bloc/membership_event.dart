import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class MembershipEvent extends Equatable {
  const MembershipEvent();

  @override
  List<Object?> get props => [];
}

class ChangeTabEvent extends MembershipEvent {
  final int index;
  const ChangeTabEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class UpdateVehicleImageEvent extends MembershipEvent {
  final File? image;
  const UpdateVehicleImageEvent(this.image);

  @override
  List<Object?> get props => [image];
}
