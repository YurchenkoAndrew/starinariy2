import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starinariy2/features/home/presentation/manager/slide_cubit.dart';
import 'package:starinariy2/features/home/presentation/manager/slide_state.dart';

class SlideWidget extends StatelessWidget {
  const SlideWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlideCubit, SlideState>(builder: (context, state) {
      String slide = '';
      if (state is SlideLoading) {
        return _loadingIndicator();
      } else if(state is SlideLoaded){
        slide = state.slide.image;
      }
      return Text(slide);
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
