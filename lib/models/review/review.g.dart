// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDetailWithPhotos _$ReviewDetailWithPhotosFromJson(
        Map<String, dynamic> json) =>
    ReviewDetailWithPhotos(
      id: json['reviewNo'] as int,
      nickname: json['nickname'] as String,
      reviewCnt: json['reviewCnt'] as int,
      starAvg: (json['starAvg'] as num).toDouble(),
      content: json['content'] as String,
      star: json['star'] as int,
      regDtm: json['regDtm'] as String,
      imgs: (json['imgs'] as List<dynamic>).map((e) => e as String).toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      isLike: json['isLike'] as bool,
    );

Map<String, dynamic> _$ReviewDetailWithPhotosToJson(
        ReviewDetailWithPhotos instance) =>
    <String, dynamic>{
      'reviewNo': instance.id,
      'nickname': instance.nickname,
      'reviewCnt': instance.reviewCnt,
      'starAvg': instance.starAvg,
      'content': instance.content,
      'star': instance.star,
      'regDtm': instance.regDtm,
      'imgs': instance.imgs,
      'tags': instance.tags,
      'isLike': instance.isLike,
    };
