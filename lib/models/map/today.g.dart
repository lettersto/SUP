// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Today _$TodayFromJson(Map<String, dynamic> json) => Today(
      storeNo: json['storeNo'] as int,
      storeName: json['storeName'] as String,
      address: json['address'] as String,
      category: json['category'] as int,
      reviewCnt: json['reviewCnt'] as int,
      starAvg: (json['starAvg'] as num).toDouble(),
      imgs: (json['imgs'] as List<dynamic>).map((e) => e as String).toList(),
      isWish: json['isWish'] as bool,
    );

Map<String, dynamic> _$TodayToJson(Today instance) => <String, dynamic>{
      'storeNo': instance.storeNo,
      'storeName': instance.storeName,
      'address': instance.address,
      'category': instance.category,
      'reviewCnt': instance.reviewCnt,
      'starAvg': instance.starAvg,
      'imgs': instance.imgs,
      'isWish': instance.isWish,
    };

TodayResponse _$TodayResponseFromJson(Map<String, dynamic> json) =>
    TodayResponse(
      list: (json['list'] as List<dynamic>)
          .map((e) => Today.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodayResponseToJson(TodayResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
