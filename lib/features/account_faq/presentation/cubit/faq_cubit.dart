import 'package:bloc/bloc.dart';
import '../cubit/faq_state.dart';

class FAQCubit extends Cubit<FAQState> {
  FAQCubit() : super(FAQState());

  void selectQuestion(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void clearSelection() {
    emit(state.copyWith(selectedIndex: -1));
  }
}
