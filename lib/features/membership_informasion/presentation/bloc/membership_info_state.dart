abstract class MembershipInfoState {}

class MembershipInfoInitial extends MembershipInfoState {}

class MembershipInfoLoaded extends MembershipInfoState {
  final String vehicleType;
  final String registrationDate;
  final String extendDate;
  final String expiredDate;
  final String status;

  MembershipInfoLoaded({
    required this.vehicleType,
    required this.registrationDate,
    required this.extendDate,
    required this.expiredDate,
    required this.status,
  });
}
