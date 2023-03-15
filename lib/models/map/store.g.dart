// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      json['storeNo'] as int,
      json['storeName'] as String,
      (json['lat'] as num).toDouble(),
      (json['lng'] as num).toDouble(),
      (json['starAvg'] as num).toDouble(),
      json['reviewCnt'] as int,
      (json['imgs'] as List<dynamic>).map((e) => e as String).toList(),
      (json['reviews'] as List<dynamic>).map((e) => e as String).toList(),
      (json['distance'] as num).toDouble(),
      json['address'] as String,
      json['category'] as int,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'storeNo': instance.storeNo,
      'storeName': instance.storeName,
      'lat': instance.lat,
      'lng': instance.lng,
      'starAvg': instance.starAvg,
      'reviewCnt': instance.reviewCnt,
      'imgs': instance.imgs,
      'reviews': instance.reviews,
      'distance': instance.distance,
      'address': instance.address,
      'category': instance.category,
    };

StoreResponse _$StoreResponseFromJson(Map<String, dynamic> json) =>
    StoreResponse(
      list: (json['list'] as List<dynamic>)
          .map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreResponseToJson(StoreResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
