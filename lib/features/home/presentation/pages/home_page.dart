import 'package:flutter/material.dart';
import 'package:starinariy2/features/home/presentation/widgets/slide_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starinariy'),
      ),
      body: const SlideWidget(),
    );
  }
}
