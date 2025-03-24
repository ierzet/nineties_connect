import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  void loadNotifications() {
    emit(NotificationLoading());

    // Contoh data notifikasi
    final notifications = [
      {"title": "Selamat Datang di 90s Super Apps", "date": "Feb 2, 2025"},
      {"title": "Lengkapi Profilmu", "date": "Feb 6, 2025"},
      {"title": "Promo 90s x Neck Damn", "date": "Feb 11, 2025"},
      {"title": "Pembelanjaan Sabun Autocare", "date": "Feb 13, 2025"},
    ];

    Future.delayed(const Duration(seconds: 1), () {
      emit(NotificationLoaded(notifications));
    });
  }
}
