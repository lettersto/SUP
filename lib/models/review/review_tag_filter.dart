import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'review_tag_filter.freezed.dart';

@freezed
class ReviewTagFilter with _$ReviewTagFilter {
  const factory ReviewTagFilter({
    required int tagLength,
    required int selected,
    required List<bool> selectedState,
  }) = _ReviewTagFilter;
}
