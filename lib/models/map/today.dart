import 'package:json_annotation/json_annotation.dart';
import 'package:sup/models/map/today.dart';

part 'today.g.dart';

@JsonSerializable()
class Today {
  final int storeNo;
  final String storeName;
  final String address;
  final int category;
  final int reviewCnt;
  final double starAvg;
  final List<String> imgs;
  bool isWish;

  Today(
      {required this.storeNo,
      required this.storeName,
      required this.address,
      required this.category,
      required this.reviewCnt,
      required this.starAvg,
      required this.imgs,
      required this.isWish});

  Today.init()
      : storeNo = 0,
        storeName = "",
        address = "",
        category = 0,
        reviewCnt = 0,
        starAvg = 0.0,
        imgs = [],
        isWish = false;

  factory Today.fromJson(Map<String, dynamic> json) => _$TodayFromJson(json);

  Map<String, dynamic> toJson() => _$TodayToJson(this);
}

@JsonSerializable()
class TodayResponse {
  final List<Today> list;

  TodayResponse({required this.list});

  factory TodayResponse.fromJson(Map<String, dynamic> json) =>
      _$TodayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TodayResponseToJson(this);
}
