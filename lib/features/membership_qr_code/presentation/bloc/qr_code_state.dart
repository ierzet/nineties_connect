abstract class QrCodeState {}

class QrCodeInitial extends QrCodeState {}

class QrCodeLoaded extends QrCodeState {
  final String qrCodePath;

  QrCodeLoaded(this.qrCodePath);
}
