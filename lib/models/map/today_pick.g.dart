// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_pick.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayPick _$TodayPickFromJson(Map<String, dynamic> json) => TodayPick(
      storeNo: json['storeNo'] as int,
      storeName: json['storeName'] as String,
      address: json['address'] as String,
      category: json['category'] as String,
      reviewCnt: json['reviewCnt'] as int,
      starAvg: (json['starAvg'] as num).toDouble(),
      imgs: (json['imgs'] as List<dynamic>).map((e) => e as String).toList(),
      isWish: json['isWish'] as bool,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$TodayPickToJson(TodayPick instance) => <String, dynamic>{
      'storeNo': instance.storeNo,
      'storeName': instance.storeName,
      'address': instance.address,
      'category': instance.category,
      'reviewCnt': instance.reviewCnt,
      'starAvg': instance.starAvg,
      'imgs': instance.imgs,
      'lat': instance.lat,
      'lng': instance.lng,
      'isWish': instance.isWish,
    };

TodayResponse _$TodayResponseFromJson(Map<String, dynamic> json) =>
    TodayResponse(
      list: (json['list'] as List<dynamic>)
          .map((e) => TodayPick.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodayResponseToJson(TodayResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
