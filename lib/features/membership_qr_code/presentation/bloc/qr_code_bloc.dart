import 'package:flutter_bloc/flutter_bloc.dart';
import 'qr_code_event.dart';
import 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc() : super(QrCodeInitial()) {
    on<LoadQrCode>((event, emit) {
      // Path ke file lokal JPG
      const qrCodeAssetPath = "assets/images/qr_code.jpg";

      emit(QrCodeLoaded(qrCodeAssetPath));
    });
  }
}
