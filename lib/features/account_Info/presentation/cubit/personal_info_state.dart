part of 'personal_info_cubit.dart';

class PersonalInfoState extends Equatable {
  final String name;
  final String email;
  final String birthDate;
  final String phoneNumber;
  final String address;
  final String password;

  const PersonalInfoState({
    required this.name,
    required this.email,
    required this.birthDate,
    required this.phoneNumber,
    required this.address,
    required this.password,
  });

  PersonalInfoState copyWith({
    String? name,
    String? email,
    String? birthDate,
    String? phoneNumber,
    String? address,
    String? password,
  }) {
    return PersonalInfoState(
      name: name ?? this.name,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [name, email, birthDate, phoneNumber, address, password];
}
