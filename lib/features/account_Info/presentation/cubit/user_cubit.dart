import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(const UserState(
          name: "John Doe",
          email: "johndoe@gmail.com",
          birthDate: "01/01/1990",
          phone: "081234567890",
          address: "Jl. Merdeka No. 1",
          password: "*******",
        ));

  void updateUserInfo(String field, String value) {
    emit(state.copyWith(field: field, value: value));
  }
}
