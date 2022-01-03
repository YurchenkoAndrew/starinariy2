import 'package:dartz/dartz.dart';
import 'package:starinariy2/core/errors/Failure.dart';
import 'package:starinariy2/core/errors/exception.dart';
import 'package:starinariy2/core/platform/network_info.dart';
import 'package:starinariy2/features/home/data/local/data_sources/slide_local_data_source.dart';
import 'package:starinariy2/features/home/data/remote/data_sources/slide_remote_data_source.dart';
import 'package:starinariy2/features/home/domain/entities/slide.dart';
import 'package:starinariy2/features/home/domain/repositories/slide_repository.dart';

class SlideRepositoryImpl implements SlideRepository {
  final SlideRemoteDataSource slideRemoteDataSource;
  final SlideLocalDataSource slideLocalDataSource;
  final NetworkInfo networkInfo;

  SlideRepositoryImpl(
      {required this.slideRemoteDataSource,
      required this.slideLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Slide>> getSlide() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSlide = await slideRemoteDataSource.getSlide();
        slideLocalDataSource.slideToCache(remoteSlide);
        return Right(remoteSlide);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localSlide = await slideLocalDataSource.getLastSlideFromCache();
        return Right(localSlide);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
