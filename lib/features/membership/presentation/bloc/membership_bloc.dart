import 'package:flutter_bloc/flutter_bloc.dart';
import 'membership_event.dart';
import 'membership_state.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  MembershipBloc() : super(const MembershipState()) {
    on<ChangeTabEvent>((event, emit) {
      emit(state.copyWith(selectedTab: event.index));
    });

    on<UpdateVehicleImageEvent>((event, emit) {
      emit(state.copyWith(vehicleImage: event.image));
    });
  }
}
