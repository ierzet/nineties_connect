import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'personal_info_state.dart';

class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  PersonalInfoCubit()
      : super(PersonalInfoState(
          name: 'Muhammad Fakhri Junaidi',
          email: 'fakhrijunaidi@gmail.com',
          birthDate: '15/05/1996',
          phoneNumber: '081219448141',
          address: 'Cilandak Indah I No.94',
          password: '',
        ));

  void updateInfo({String? name, String? email, String? birthDate, String? phoneNumber, String? address, String? password}) {
    emit(state.copyWith(
      name: name ?? state.name,
      email: email ?? state.email,
      birthDate: birthDate ?? state.birthDate,
      phoneNumber: phoneNumber ?? state.phoneNumber,
      address: address ?? state.address,
      password: password ?? state.password,
    ));
  }
}
