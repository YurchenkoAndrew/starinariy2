import 'package:dartz/dartz.dart';
import 'package:starinariy2/core/errors/Failure.dart';
import 'package:starinariy2/features/home/domain/entities/slide.dart';

abstract class SlideRepository {
  Future<Either<Failure, Slide>> getSlide();
}
