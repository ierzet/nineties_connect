import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit() : super(ActivityInitial());

  void loadActivities() {
    emit(ActivityLoading());

    // Simulasi pengambilan data dari API atau database
    Future.delayed(const Duration(seconds: 1), () {
      final activities = [
        {'title': 'Pandu Raya', 'date': 'Feb 3, 2025'},
        {'title': 'Dramaga', 'date': 'Feb 6, 2025'},
        {'title': 'Cilendek', 'date': 'Feb 11, 2025'},
        {'title': 'Cilendek', 'date': 'Feb 13, 2025'},
        {'title': 'Pandu Raya', 'date': 'Feb 17, 2025'},
        {'title': 'Pandu Raya', 'date': 'Feb 18, 2025'},
        {'title': 'Pandu Raya', 'date': 'Feb 19, 2025'},
        {'title': 'Pandu Raya', 'date': 'Feb 20, 2025'},
        {'title': 'Pandu Raya', 'date': 'Feb 21, 2025'},
        {'title': 'Pandu Raya', 'date': 'Feb 22, 2025'},
        {'title': 'Pandu Raya', 'date': 'Feb 24, 2025'},
        {'title': 'Pandu Raya', 'date': 'Feb 25, 2025'},
      ];
      emit(ActivityLoaded(activities));
    });
  }
}
