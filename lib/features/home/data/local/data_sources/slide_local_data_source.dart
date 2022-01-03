import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:starinariy2/core/errors/exception.dart';
import 'package:starinariy2/features/home/data/remote/models/slide_model.dart';

const cachedSlide = 'CACHED_SLIDE';

abstract class SlideLocalDataSource {
  Future<SlideModel> getLastSlideFromCache();

  Future<void> slideToCache(SlideModel slide);
}

class SlideLocalDataSourceImpl implements SlideLocalDataSource {
  final SharedPreferences sharedPreferences;

  SlideLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<SlideModel> getLastSlideFromCache() {
    final jsonSlide = sharedPreferences.getString(cachedSlide);
    if(jsonSlide!.isNotEmpty){
      return Future.value(SlideModel.fromJson(json.decode(jsonSlide)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> slideToCache(SlideModel slide) {
    final String jsonSlide = json.encode(slide.toJson());
    sharedPreferences.setString(cachedSlide, jsonSlide);
    return Future.value();
  }
}
