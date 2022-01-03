import 'package:equatable/equatable.dart';
import 'package:starinariy2/features/home/domain/entities/slide.dart';

abstract class SlideState extends Equatable {
  const SlideState();

  @override
  List<Object?> get props => [];
}

class SlideEmpty extends SlideState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SlideLoading extends SlideState {
  final Slide oldSlide;

  const SlideLoading(this.oldSlide);

  @override
  List<Object?> get props => [oldSlide];
}

class SlideLoaded extends SlideState {
  final Slide slide;

  const SlideLoaded(this.slide);

  @override
  List<Object?> get props => [slide];
}

class SlideError extends SlideState {
  final String message;

  const SlideError({required this.message});

  @override
  List<Object?> get props => [message];
}
