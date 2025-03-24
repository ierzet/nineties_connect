import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nineties_connect/features/notifications/presentation/cubit/notification_cubit.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationCubit()..loadNotifications(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              top: -320,
              right: -350,
              child: Container(
                width: 820,
                height: 820,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFFFDD00).withOpacity(0.5),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 70),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFFFDD00), width: 2),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          context.go('/main');
                        },
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Text(
                      "Notifications",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: BlocBuilder<NotificationCubit, NotificationState>(
                      builder: (context, state) {
                        if (state is NotificationLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is NotificationLoaded) {
                          return ListView(
                            padding: const EdgeInsets.only(top: 10), // Menambahkan padding atas minimal
                            children: state.notifications
                                .map((notification) => _buildNotificationItem(notification["title"]!, notification["date"]!))
                                .toList(),
                          );
                        } else {
                          return const Center(child: Text("Tidak ada notifikasi"));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(String title, String date) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 1.0)),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontFamily: 'Montserrat', color: Colors.black, fontSize: 14), // Menghapus fontWeight
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0), // Mengubah padding untuk mendekatkan tulisan
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              date,
              style: const TextStyle(fontFamily: 'Montserrat', color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
