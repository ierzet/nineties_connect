import 'package:flutter_bloc/flutter_bloc.dart';
import 'membership_info_event.dart';
import 'membership_info_state.dart';

class MembershipInfoBloc extends Bloc<MembershipInfoEvent, MembershipInfoState> {
  MembershipInfoBloc() : super(MembershipInfoInitial()) {
    on<LoadMembershipInfo>(_onLoadMembershipInfo);
  }

  void _onLoadMembershipInfo(LoadMembershipInfo event, Emitter<MembershipInfoState> emit) {
    emit(MembershipInfoLoaded(
      vehicleType: "Large",
      registrationDate: "Feb 11, 2025",
      extendDate: "Feb 11, 2025",
      expiredDate: "March 11, 2025",
      status: "Active",
    ));
  }
}
