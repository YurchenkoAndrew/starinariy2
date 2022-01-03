import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starinariy2/core/errors/exception.dart';
import 'package:starinariy2/features/home/data/remote/models/slide_model.dart';

abstract class SlideRemoteDataSource {
  Future<SlideModel> getSlide();
}

class SlideRemoteDataSourceImpl implements SlideRemoteDataSource {
  final http.Client client;

  SlideRemoteDataSourceImpl({required this.client});

  @override
  Future<SlideModel> getSlide() async {
    final response = await client.get(
        Uri.parse('https://api.starinariy.kz/api/main-slider-one'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final slide = json.decode(response.body);
      return slide;
    } else {
      throw ServerException();
    }
  }
}
