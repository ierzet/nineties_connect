import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  void logout() {
    emit(LogoutLoading());

    // Simulasi proses logout (misal hapus token atau sesi pengguna)
    Future.delayed(const Duration(seconds: 1), () {
      emit(LogoutSuccess());
    });
  }
}
