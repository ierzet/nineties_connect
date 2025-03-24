import 'package:flutter_bloc/flutter_bloc.dart';
import 'gallery_event.dart';
import 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(GalleryLoading()) {
    on<LoadGallery>((event, emit) async {
      try {
        await Future.delayed(Duration(seconds: 2)); // Simulasi loading
        final List<String> images = [
          'assets/images/car.png',
          'assets/images/car.png',
          'assets/images/car.png',
          'assets/images/car.png',
        ];
        emit(GalleryLoaded(images));
      } catch (e) {
        emit(GalleryError('Gagal memuat gambar.'));
      }
    });
  }
}
