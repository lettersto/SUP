import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/review_repository.dart';
import '../models/review_filter.dart';
import '../notifiers/review_notifier.dart';
import '../../../utils/enums.dart';

// reviews
final reviewRepositoryProvider =
    Provider<ReviewRepository>((ref) => ReviewRepository());

// review filters
final selectedReviewFilterProvider =
    NotifierProvider<ReviewFilterNotifier, int>(() => ReviewFilterNotifier());

final isFilterSelectedProvider =
    Provider.family((ref, ReviewFilterType filter) {
  final idx = ReviewFilters.reviewFilterTypeMap[filter];
  final selectedFilterIdx = ref.watch(selectedReviewFilterProvider);
  return idx == selectedFilterIdx;
});
