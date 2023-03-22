// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagChartItemModel _$$_TagChartItemModelFromJson(Map<String, dynamic> json) =>
    _$_TagChartItemModel(
      tagNo: json['tagNo'] as int,
      value: json['value'] as String,
      tagCnt: json['tagCnt'] as int,
    );

Map<String, dynamic> _$$_TagChartItemModelToJson(
        _$_TagChartItemModel instance) =>
    <String, dynamic>{
      'tagNo': instance.tagNo,
      'value': instance.value,
      'tagCnt': instance.tagCnt,
    };

_$_TagChartModel _$$_TagChartModelFromJson(Map<String, dynamic> json) =>
    _$_TagChartModel(
      totalCnt: json['totalCnt'] as int,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagChartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TagChartModelToJson(_$_TagChartModel instance) =>
    <String, dynamic>{
      'totalCnt': instance.totalCnt,
      'tags': instance.tags,
    };
