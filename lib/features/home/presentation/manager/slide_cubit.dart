import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starinariy2/core/errors/Failure.dart';
import 'package:starinariy2/features/home/domain/use_cases/get_slide.dart';
import 'package:starinariy2/features/home/presentation/manager/slide_state.dart';

const serverFailureMessage = 'Server Error';
const cacheFailureMessage = 'Cache Error';
const defaultFailureMessage = 'Unexpected Error!';

class SlideCubit extends Cubit<SlideState> {
  final GetSlide getSlide;

  SlideCubit({required this.getSlide}) : super(SlideEmpty());

  void loadSlide() async {
    if (state is SlideLoading) return;
    final failureOrSlide = await getSlide();
    failureOrSlide.fold(
        (error) => SlideError(message: _mapFailureToMessage(error)), (item) {
      emit(SlideLoaded(item));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return defaultFailureMessage;
    }
  }
}
