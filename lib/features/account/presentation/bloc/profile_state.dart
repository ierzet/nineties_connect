import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final String name;
  final String joinedDate;
  final bool isBiometricEnabled;

  const ProfileState({
    required this.name,
    required this.joinedDate,
    this.isBiometricEnabled = false,
  });

  ProfileState copyWith({
    String? name,
    String? joinedDate,
    bool? isBiometricEnabled,
  }) {
    return ProfileState(
      name: name ?? this.name,
      joinedDate: joinedDate ?? this.joinedDate,
      isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
    );
  }

  @override
  List<Object> get props => [name, joinedDate, isBiometricEnabled];
}
