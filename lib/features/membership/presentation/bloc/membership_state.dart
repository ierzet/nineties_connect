import 'package:equatable/equatable.dart';
import 'dart:io';

class MembershipState extends Equatable {
  final int selectedTab;
  final File? vehicleImage;

  const MembershipState({this.selectedTab = 1, this.vehicleImage});

  MembershipState copyWith({int? selectedTab, File? vehicleImage}) {
    return MembershipState(
      selectedTab: selectedTab ?? this.selectedTab,
      vehicleImage: vehicleImage ?? this.vehicleImage,
    );
  }

  @override
  List<Object?> get props => [selectedTab, vehicleImage];
}
