class UserState {
  final String name;
  final String email;
  final String birthDate;
  final String phone;
  final String address;
  final String password;

  const UserState({
    required this.name,
    required this.email,
    required this.birthDate,
    required this.phone,
    required this.address,
    required this.password,
  });

  UserState copyWith({required String field, required String value}) {
    return UserState(
      name: field == "name" ? value : name,
      email: field == "email" ? value : email,
      birthDate: field == "birthDate" ? value : birthDate,
      phone: field == "phone" ? value : phone,
      address: field == "address" ? value : address,
      password: field == "password" ? value : password,
    );
  }
}
