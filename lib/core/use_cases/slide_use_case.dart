import 'package:dartz/dartz.dart';
import 'package:starinariy2/core/errors/Failure.dart';

abstract class SlideUseCase<Type> {
  Future<Either<Failure, Type>> call();
}
