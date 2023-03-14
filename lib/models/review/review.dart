import 'package:json_annotation/json_annotation.dart';

import '../common/model_with_id.dart';

part 'review.g.dart';

@JsonSerializable()
class ReviewDetailWithPhotos extends IModelWithId {
  @override
  @JsonKey(name: 'reviewNo')
  final int id;
  final String nickname;
  final int reviewCnt;
  final double starAvg;
  final String content;
  final int star;
  final String regDtm;
  final List<String> imgs;
  final List<String> tags;
  final bool isLike;

  ReviewDetailWithPhotos({
    required this.id,
    required this.nickname,
    required this.reviewCnt,
    required this.starAvg,
    required this.content,
    required this.star,
    required this.regDtm,
    required this.imgs,
    required this.tags,
    required this.isLike,
  }) : super(id: 0);

  factory ReviewDetailWithPhotos.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailWithPhotosFromJson(json);
}
