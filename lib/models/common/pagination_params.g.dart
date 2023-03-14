// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationParams _$PaginationParamsFromJson(Map<String, dynamic> json) =>
    PaginationParams(
      lastNo: json['lastNo'] as int?,
      size: json['size'] as int?,
      tagNo: json['tagNo'] as int?,
      keyword: json['keyword'] as String?,
      sort: json['sort'] as String?,
      imgOnly: json['imgOnly'] as bool?,
    );

Map<String, dynamic> _$PaginationParamsToJson(PaginationParams instance) =>
    <String, dynamic>{
      'lastNo': instance.lastNo,
      'size': instance.size,
      'tagNo': instance.tagNo,
      'keyword': instance.keyword,
      'sort': instance.sort,
      'imgOnly': instance.imgOnly,
    };

ReviewDetailParams _$ReviewDetailParamsFromJson(Map<String, dynamic> json) =>
    ReviewDetailParams(
      storeNo: json['storeNo'] as int,
      userNo: json['userNo'] as int,
    );

Map<String, dynamic> _$ReviewDetailParamsToJson(ReviewDetailParams instance) =>
    <String, dynamic>{
      'storeNo': instance.storeNo,
      'userNo': instance.userNo,
    };
