import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/review/review_tag_filter.dart';
import '../../models/review/review_filter_notifier.dart';
import '../../../../utils/enums.dart';

final reviewFilterOnlyPhotoProvider =
    NotifierProvider<ReviewFilterImageOnlyNotifier, bool>(
        ReviewFilterImageOnlyNotifier.new);

final reviewFilterStarRegDtmProvider = NotifierProvider<
    ReviewFilterStarRegDtmNotifier,
    ReviewFilterStarRegDtmType>(ReviewFilterStarRegDtmNotifier.new);

final reviewTagFilterProvider =
    NotifierProvider<ReviewTagFilterNotifier, ReviewTagFilter>(
        ReviewTagFilterNotifier.new);

final reviewSearchKeywordProvider =
    AutoDisposeNotifierProvider<ReviewSearchKeywordNotifier, String>(
        ReviewSearchKeywordNotifier.new);
