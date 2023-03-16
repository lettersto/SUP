// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      userNo: json['userNo'] as int,
      storeNo: json['storeNo'] as int,
      content: json['content'] as String,
      star: json['star'] as int,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'content': instance.content,
      'star': instance.star,
      'tags': instance.tags,
      'userNo': instance.userNo,
      'storeNo': instance.storeNo,
    };

ReviewDetail _$ReviewDetailFromJson(Map<String, dynamic> json) => ReviewDetail(
      userNo: json['userNo'] as int,
      nickname: json['nickname'] as String,
      reviewNo: json['reviewNo'] as int,
      regDtm: json['regDtm'] as String,
      img: json['img'] as String,
      content: json['content'] as String,
      star: json['star'] as int,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ReviewDetailToJson(ReviewDetail instance) =>
    <String, dynamic>{
      'content': instance.content,
      'star': instance.star,
      'tags': instance.tags,
      'userNo': instance.userNo,
      'reviewNo': instance.reviewNo,
      'nickname': instance.nickname,
      'regDtm': instance.regDtm,
      'img': instance.img,
    };

ReviewDetailWithPhotos _$ReviewDetailWithPhotosFromJson(
        Map<String, dynamic> json) =>
    ReviewDetailWithPhotos(
      id: json['reviewNo'] as int,
      reviewCnt: json['reviewCnt'] as int,
      starAvg: (json['starAvg'] as num).toDouble(),
      isLike: json['isLike'] as bool,
      nickname: json['nickname'] as String,
      regDtm: json['regDtm'] as String,
      imgs: (json['imgs'] as List<dynamic>).map((e) => e as String).toList(),
      content: json['content'] as String,
      star: json['star'] as int,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ReviewDetailWithPhotosToJson(
        ReviewDetailWithPhotos instance) =>
    <String, dynamic>{
      'content': instance.content,
      'star': instance.star,
      'tags': instance.tags,
      'reviewNo': instance.id,
      'reviewCnt': instance.reviewCnt,
      'nickname': instance.nickname,
      'starAvg': instance.starAvg,
      'regDtm': instance.regDtm,
      'imgs': instance.imgs,
      'isLike': instance.isLike,
    };
