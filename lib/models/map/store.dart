import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  final int storeNo;
  final String storeName;
  final double lat;
  final double lng;
  final double starAvg;
  final int reviewCnt;
  final List<String> imgs;
  final List<String> reviews;
  final double distance;
  final String address;
  final int category;

  Store(
      this.storeNo,
      this.storeName,
      this.lat,
      this.lng,
      this.starAvg,
      this.reviewCnt,
      this.imgs,
      this.reviews,
      this.distance,
      this.address,
      this.category);

  Store.init()
      : storeNo = 0,
        storeName = "",
        lat = 0.0,
        lng = 0.0,
        starAvg = 0.0,
        reviewCnt = 0,
        imgs = [],
        reviews = [],
        distance = 0.0,
        address = "",
        category = 0;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}

@JsonSerializable()
class StoreResponse {
  final List<Store> list;

  StoreResponse({required this.list});

  factory StoreResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StoreResponseToJson(this);
}
