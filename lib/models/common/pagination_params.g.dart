// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationQueryParams _$PaginationQueryParamsFromJson(
        Map<String, dynamic> json) =>
    PaginationQueryParams(
      lastNo: json['lastNo'] as int?,
      size: json['size'] as int?,
      tagNo: json['tagNo'] as int?,
      keyword: json['keyword'] as String?,
      sort: json['sort'] as String?,
      imgOnly: json['imgOnly'] as bool?,
    );

Map<String, dynamic> _$PaginationQueryParamsToJson(
        PaginationQueryParams instance) =>
    <String, dynamic>{
      'lastNo': instance.lastNo,
      'size': instance.size,
      'tagNo': instance.tagNo,
      'keyword': instance.keyword,
      'sort': instance.sort,
      'imgOnly': instance.imgOnly,
    };

PaginationPathParams _$PaginationPathParamsFromJson(
        Map<String, dynamic> json) =>
    PaginationPathParams(
      storeNo: json['storeNo'] as int?,
      userNo: json['userNo'] as int?,
    );

Map<String, dynamic> _$PaginationPathParamsToJson(
        PaginationPathParams instance) =>
    <String, dynamic>{
      'storeNo': instance.storeNo,
      'userNo': instance.userNo,
    };

Params _$ParamsFromJson(Map<String, dynamic> json) => Params(
      paginationPathParams: PaginationPathParams.fromJson(
          json['paginationPathParams'] as Map<String, dynamic>),
      paginationQueryParams: PaginationQueryParams.fromJson(
          json['paginationQueryParams'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParamsToJson(Params instance) => <String, dynamic>{
      'paginationPathParams': instance.paginationPathParams,
      'paginationQueryParams': instance.paginationQueryParams,
    };
