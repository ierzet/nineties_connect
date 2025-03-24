import 'package:flutter_bloc/flutter_bloc.dart';
import 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit()
      : super(const DetailState(
          title: 'Cuci Biasa Successful',
          date: '19 Feb 2023 20:45:20',
          price: 'IDR 0',
          details: {
            'Year': '1997',
            'Plate Number': 'B 733 EM',
            'Type': '836/3231',
            'Brand': 'BMW',
            'Size': 'Medium',
            'Variant': 'Yellow',
          },
        ));
}
