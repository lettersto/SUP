import 'package:json_annotation/json_annotation.dart';

part 'like_param.g.dart';

@JsonSerializable()
class LikeParam {
  final int userNo;
  final int reviewNo;

  LikeParam({
    required this.userNo,
    required this.reviewNo,
  });

  Map<String, dynamic> toJson() => _$LikeParamToJson(this);
}
