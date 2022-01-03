import 'package:json_annotation/json_annotation.dart';
import 'package:starinariy2/features/home/domain/entities/description_slide.dart';
import 'package:starinariy2/features/home/domain/entities/slide.dart';

part 'slide_model.g.dart';

@JsonSerializable()
class SlideModel extends Slide {
  const SlideModel({
    required image,
    required description,
  }) : super(image: image, description: description);

  factory SlideModel.fromJson(Map<String, dynamic> json) =>
      _$SlideModelFromJson(json);

  Map<String, dynamic> toJson() => _$SlideModelToJson(this);
}

@JsonSerializable()
class DescriptionSlideModel extends DescriptionSlide {
  const DescriptionSlideModel(
      {required description, required position, required main_slider_id})
      : super(
            description: description,
            position: position,
            main_slider_id: main_slider_id);

  factory DescriptionSlideModel.fromJson(Map<String, dynamic> json) =>
      _$DescriptionSlideModelFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionSlideModelToJson(this);
}
