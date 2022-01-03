import 'package:dartz/dartz.dart';
import 'package:starinariy2/core/errors/Failure.dart';
import 'package:starinariy2/core/use_cases/slide_use_case.dart';
import 'package:starinariy2/features/home/domain/entities/slide.dart';
import 'package:starinariy2/features/home/domain/repositories/slide_repository.dart';

class GetSlide extends SlideUseCase<Slide> {
  final SlideRepository slideRepository;

  GetSlide(this.slideRepository);

  @override
  Future<Either<Failure, Slide>> call() async {
    return slideRepository.getSlide();
  }
}
