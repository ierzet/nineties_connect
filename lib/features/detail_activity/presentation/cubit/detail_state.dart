import 'package:equatable/equatable.dart';

class DetailState extends Equatable {
  final String title;
  final String date;
  final String price;
  final Map<String, String> details;

  const DetailState({
    required this.title,
    required this.date,
    required this.price,
    required this.details,
  });

  @override
  List<Object> get props => [title, date, price, details];
}
