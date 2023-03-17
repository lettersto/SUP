import 'package:json_annotation/json_annotation.dart';

part 'wish.g.dart';

@JsonSerializable()
class Wish {
  final int storeNo;
  final double lat;
  final double lng;

  Wish(this.storeNo, this.lat, this.lng);

  factory Wish.fromJson(Map<String, dynamic> json) => _$WishFromJson(json);

  Map<String, dynamic> toJson() => _$WishToJson(this);
}

@JsonSerializable()
class WishResponse {
  final List<Wish> list;

  WishResponse({required this.list});

  factory WishResponse.fromJson(Map<String, dynamic> json) =>
      _$WishResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WishResponseToJson(this);
}

@JsonSerializable()
class PostWishRequest {
  final int storeNo;
  final int userNo;

  PostWishRequest(this.userNo, this.storeNo);

  PostWishRequest.init()
      : userNo = 0,
        storeNo = 0;

  factory PostWishRequest.fromJson(Map<String, dynamic> json) =>
      _$PostWishRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostWishRequestToJson(this);
}

@JsonSerializable()
class PostWishResponse {
  final int wishNo;
  final double lat;
  final double lng;

  PostWishResponse(this.wishNo, this.lat, this.lng);

  PostWishResponse.init()
      : wishNo = 0,
        lat = 0,
        lng = 0;

  factory PostWishResponse.fromJson(Map<String, dynamic> json) =>
      _$PostWishResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostWishResponseToJson(this);
}
