import 'package:json_annotation/json_annotation.dart';

part 'today_pick.g.dart';

@JsonSerializable()
class TodayPick {
  final int storeNo;
  final String storeName;
  final String address;
  final String category;
  final int reviewCnt;
  final double starAvg;
  final List<String> imgs;
  final double lat;
  final double lng;
  bool isWish;

  TodayPick(
      {required this.storeNo,
      required this.storeName,
      required this.address,
      required this.category,
      required this.reviewCnt,
      required this.starAvg,
      required this.imgs,
      required this.isWish,
      required this.lat,
      required this.lng});

  TodayPick.init()
      : storeNo = 0,
        storeName = "",
        address = "",
        category = "",
        reviewCnt = 0,
        starAvg = 0.0,
        imgs = [],
        isWish = false,
        lat = 0,
        lng = 0;

  factory TodayPick.fromJson(Map<String, dynamic> json) =>
      _$TodayPickFromJson(json);

  Map<String, dynamic> toJson() => _$TodayPickToJson(this);
}

@JsonSerializable()
class TodayResponse {
  final List<TodayPick> list;

  TodayResponse({required this.list});

  factory TodayResponse.fromJson(Map<String, dynamic> json) =>
      _$TodayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TodayResponseToJson(this);
}
