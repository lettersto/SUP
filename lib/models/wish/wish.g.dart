// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wish _$WishFromJson(Map<String, dynamic> json) => Wish(
      json['storeNo'] as int,
      (json['lat'] as num).toDouble(),
      (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$WishToJson(Wish instance) => <String, dynamic>{
      'storeNo': instance.storeNo,
      'lat': instance.lat,
      'lng': instance.lng,
    };

WishResponse _$WishResponseFromJson(Map<String, dynamic> json) => WishResponse(
      list: (json['list'] as List<dynamic>)
          .map((e) => Wish.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WishResponseToJson(WishResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

PostWishRequest _$PostWishRequestFromJson(Map<String, dynamic> json) =>
    PostWishRequest(
      json['userNo'] as int,
      json['storeNo'] as int,
    );

Map<String, dynamic> _$PostWishRequestToJson(PostWishRequest instance) =>
    <String, dynamic>{
      'storeNo': instance.storeNo,
      'userNo': instance.userNo,
    };

PostWishResponse _$PostWishResponseFromJson(Map<String, dynamic> json) =>
    PostWishResponse(
      json['wishNo'] as int,
    );

Map<String, dynamic> _$PostWishResponseToJson(PostWishResponse instance) =>
    <String, dynamic>{
      'wishNo': instance.wishNo,
    };
