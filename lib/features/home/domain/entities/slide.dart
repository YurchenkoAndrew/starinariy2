import 'package:equatable/equatable.dart';
import 'package:starinariy2/features/home/domain/entities/description_slide.dart';

class Slide extends Equatable {
  final String image;
  final List<DescriptionSlide> description;

  const Slide({required this.image, required this.description});


  @override
  List<Object?> get props => [image, description];
}
