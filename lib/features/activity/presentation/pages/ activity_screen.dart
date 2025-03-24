import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nineties_connect/features/detail_activity/presentation/pages/detail_screen.dart';
import '../cubit/activity_cubit.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  static Future<void> show(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ActivityScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityCubit()..loadActivities(),
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
                      Color(0xFFFFDD00).withOpacity(0.5),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFFFFDD00), width: 2),
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
                      "Activity",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 30, // Besarkan ukuran font
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: BlocBuilder<ActivityCubit, ActivityState>(
                      builder: (context, state) {
                        if (state is ActivityLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is ActivityLoaded) {
                          return ListView.builder(
                            padding: const EdgeInsets.all(5),
                            itemCount: state.activities.length + 1,
                            itemBuilder: (context, index) {
                              if (index == state.activities.length) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10, bottom: 12),
                                    child: Text(
                                      'Cari Lebih Banyak',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.grey,
                                        fontSize: 16, // Besarkan ukuran font
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final activity = state.activities[index];
                              return _buildActivityItem(context, activity['title']!, activity['date']!);
                            },
                          );
                        }
                        return const Center(child: Text("Tidak ada data aktivitas"));
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
  Widget _buildActivityItem(BuildContext context, String title, String date) {
    return GestureDetector(
      onTap: () {
        DetailScreen.show(context);
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 1.0)),
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontFamily: 'Montserrat', color: Colors.black, fontSize: 14), // Besarkan ukuran font
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0), // Mengubah padding untuk mendekatkan tulisan
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                date,
                style: const TextStyle(fontFamily: 'Montserrat', color: Colors.grey, fontSize: 14), // Besarkan ukuran font
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
