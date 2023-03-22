import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common/cursor_pagination_model.dart';
import '../../models/common/pagination_params.dart';
import '../../models/review/image_review.dart';
import '../../models/review/review.dart';
import '../../models/review/tag_chart.dart';
import '../../repositories/review/review_repository.dart';
import '../../utils/sharedPreference_util.dart';
import '../common/common_provider.dart';
import '../common/pagination_provider.dart';
import '../store/store_detail_provider.dart';
import 'review_filter_provider.dart';

class PaginatedReviewStateNotifier extends PaginationProvider<
    ReviewDetailWithPhotos, PaginatedReviewRepository> {
  PaginatedReviewStateNotifier(
      {required super.repository,
      required super.paginationPathParams,
      required super.paginationQueryParams});
}

final paginatedReviewProvider = StateNotifierProvider.family<
    PaginatedReviewStateNotifier, CursorPaginationBase, Params>((ref, params) {
  final repository = ref.watch(paginatedReviewRepositoryProvider);
  final notifier = PaginatedReviewStateNotifier(
      repository: repository,
      paginationPathParams: params.paginationPathParams,
      paginationQueryParams: params.paginationQueryParams);

  return notifier;
});

final paginatedReviewParamsProvider = AutoDisposeProvider<Params>((ref) {
  final storeNo = ref.watch(storeDetailProvider).storeNo;
  final isOnlyPhotosSelected = ref.watch(reviewFilterOnlyPhotoProvider);
  int selectedTag = ref.watch(reviewTagFilterProvider).selected;
  if (selectedTag == -1) {
    selectedTag = 0;
  } else {
    selectedTag += 3;
  }
  final sort =
      ref.watch(reviewFilterStarRegDtmProvider).toString().split('.').last;
  final keyword = ref.watch(reviewSearchKeywordProvider);

  return Params(
      paginationPathParams: PaginationPathParams(
          storeNo: storeNo, userNo: SharedPreferenceUtil().userNo),
      paginationQueryParams: PaginationQueryParams(
          size: 10,
          tagNo: selectedTag,
          keyword: keyword,
          sort: sort,
          imgOnly: isOnlyPhotosSelected));
});

final paginatedImageParamsProvider = AutoDisposeProvider<Params>((ref) {
  final storeNo = ref.watch(storeDetailProvider).storeNo;

  return Params(
    paginationQueryParams: const PaginationQueryParams(size: 10),
    paginationPathParams: PaginationPathParams(storeNo: storeNo),
  );
});

class PaginatedImageReviewStateNotifier extends PaginationProvider<
    ImageReviewItemModel, PaginatedImageReviewRepository> {
  PaginatedImageReviewStateNotifier(
      {required super.repository,
      required super.paginationPathParams,
      required super.paginationQueryParams});
}

final paginatedImageReviewProvider = StateNotifierProvider.family<
    PaginatedImageReviewStateNotifier,
    CursorPaginationBase,
    Params>((ref, params) {
  final repository = ref.watch(paginatedImageReviewRepositoryProvider);
  final notifier = PaginatedImageReviewStateNotifier(
      repository: repository,
      paginationPathParams: params.paginationPathParams,
      paginationQueryParams: params.paginationQueryParams);

  return notifier;
});

final reviewClientProvider = Provider<ReviewClient>((ref) {
  final dio = ref.watch(dioProvider);
  return ReviewClient(dio);
});

class ReviewChartNotifier extends AsyncNotifier<TagChartModel> {
  ReviewChartNotifier();

  @override
  FutureOr<TagChartModel> build() async {
    return await ref
        .watch(reviewClientProvider)
        .getTagChart(storeNo: ref.watch(storeDetailProvider).storeNo);
  }
}

final reviewChartProvider =
    AsyncNotifierProvider<ReviewChartNotifier, TagChartModel>(
        ReviewChartNotifier.new);

class ReviewTotalCountNotifier extends StateNotifier<int> {
  final ReviewClient reviewClient;

  ReviewTotalCountNotifier({
    required this.reviewClient,
  }) : super(0);

  void getTotalReviewCount(int storeNo) async {
    try {
      state = await reviewClient.getTotalReviewCount(storeNo: storeNo);
    } catch (err) {
      print(err);
    }
  }
}

final reviewTotalCountProvider =
    StateNotifierProvider<ReviewTotalCountNotifier, int>((ref) {
  final reviewClient = ref.watch(reviewClientProvider);
  return ReviewTotalCountNotifier(reviewClient: reviewClient);
});
