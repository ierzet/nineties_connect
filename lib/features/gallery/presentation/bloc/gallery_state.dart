import 'package:equatable/equatable.dart';

class GalleryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GalleryLoading extends GalleryState {}

class GalleryLoaded extends GalleryState {
  final List<String> images; // List URL atau asset gambar

  GalleryLoaded(this.images);

  @override
  List<Object?> get props => [images];
}

class GalleryError extends GalleryState {
  final String message;

  GalleryError(this.message);

  @override
  List<Object?> get props => [message];
}
