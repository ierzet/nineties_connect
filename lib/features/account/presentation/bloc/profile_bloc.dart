import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState(name: "Muhammad Fakhri Junaidi", joinedDate: "1 January 2025")) {
    on<LoadProfile>(_onLoadProfile);
    on<ToggleBiometric>(_onToggleBiometric);
  }

  void _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) {
    // Simulasi loading data dari API atau database
    emit(state.copyWith(
      name: "Muhammad Fakhri Junaidi",
      joinedDate: "1 January 2025",
    ));
  }

  void _onToggleBiometric(ToggleBiometric event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isBiometricEnabled: !state.isBiometricEnabled));
  }
}
