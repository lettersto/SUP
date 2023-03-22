import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'tag_chart.freezed.dart';
part 'tag_chart.g.dart';

@freezed
class TagChartItemModel with _$TagChartItemModel {
  const factory TagChartItemModel({
    required int tagNo,
    required String value,
    required int tagCnt,
  }) = _TagChartItemModel;

  factory TagChartItemModel.fromJson(Map<String, Object?> json) =>
      _$TagChartItemModelFromJson(json);
}

@freezed
class TagChartModel with _$TagChartModel {
  const factory TagChartModel({
    required int totalCnt,
    required List<TagChartItemModel> tags,
  }) = _TagChartModel;

  factory TagChartModel.fromJson(Map<String, Object?> json) =>
      _$TagChartModelFromJson(json);
}
