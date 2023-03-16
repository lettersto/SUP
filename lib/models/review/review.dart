import 'package:json_annotation/json_annotation.dart';

import '../common/model_with_id.dart';

part 'review.g.dart';

abstract class ReviewBase {
  final String content;
  final int star;
  final List<String> tags;

  ReviewBase({
    required this.content,
    required this.star,
    required this.tags,
  });
}

@JsonSerializable()
class Review extends ReviewBase {
  final int userNo;
  final int storeNo;

  Review({
    required this.userNo,
    required this.storeNo,
    required String content,
    required int star,
    required List<String> tags,
  }) : super(content: content, star: star, tags: tags);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable()
class ReviewDetail extends ReviewBase {
  final int userNo;
  final int reviewNo;
  final String nickname;
  final String regDtm;
  final String img;

  ReviewDetail({
    required this.userNo,
    required this.nickname,
    required this.reviewNo,
    required this.regDtm,
    required this.img,
    required String content,
    required int star,
    required List<String> tags,
  }) : super(content: content, star: star, tags: tags);

  factory ReviewDetail.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailFromJson(json);
}

@JsonSerializable()
class ReviewDetailWithPhotos extends ReviewBase implements IModelWithId {
  @override
  @JsonKey(name: 'reviewNo')
  final int id; // for pagination
  final int reviewCnt;
  final String nickname;
  final double starAvg;
  final String regDtm;
  final List<String> imgs;
  final bool isLike;

  ReviewDetailWithPhotos({
    required this.id,
    required this.reviewCnt,
    required this.starAvg,
    required this.isLike,
    required this.nickname,
    required this.regDtm,
    required this.imgs,
    required String content,
    required int star,
    required List<String> tags,
  }) : super(content: content, star: star, tags: tags);

  factory ReviewDetailWithPhotos.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailWithPhotosFromJson(json);
}
