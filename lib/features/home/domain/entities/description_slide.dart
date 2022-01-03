import 'package:equatable/equatable.dart';

class DescriptionSlide extends Equatable {
  final String description;
  final int position;
  final int main_slider_id;

  const DescriptionSlide(
      {required this.description,
      required this.position,
      required this.main_slider_id});

  @override
  List<Object?> get props => [description, position, main_slider_id];
}
