import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/review/review_filter.dart';
import '../models/review/review_filter_notifier.dart';
import '../../../utils/enums.dart';

// review filters
final selectedReviewFilterProvider =
    NotifierProvider<ReviewFilterNotifier, int>(() => ReviewFilterNotifier());

final isFilterSelectedProvider =
    Provider.family((ref, ReviewFilterType filter) {
  final idx = ReviewFilters.reviewFilterTypeMap[filter];
  final selectedFilterIdx = ref.watch(selectedReviewFilterProvider);
  return idx == selectedFilterIdx;
});
