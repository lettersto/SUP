import 'package:json_annotation/json_annotation.dart';

import '../common/model_with_id.dart';

part 'image_review.g.dart';

@JsonSerializable()
class ImageReviewItemModel implements IModelWithId {
  @override
  @JsonKey(name: 'reviewImgNo')
  final int id;
  final String imgUrl;

  ImageReviewItemModel({
    required this.id,
    required this.imgUrl,
  });

  factory ImageReviewItemModel.fromJson(Map<String, dynamic> json) =>
      _$ImageReviewItemModelFromJson(json);
}
