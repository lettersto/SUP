import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/models/common/pagination_params.dart';
import 'package:sup/models/review/image_review.dart';
import 'package:sup/models/review/tag_chart.dart';
import 'package:sup/providers/store/store_detail_provider.dart';

import '../../models/common/cursor_pagination_model.dart';
import '../../models/review/review.dart';
import '../../repositories/review/review_repository.dart';
import '../common/common_provider.dart';
import '../common/pagination_provider.dart';

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

  FutureOr<TagChartModel> refetch() async {
    print('???');
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

  void getReviewChart(int storeNo) async {
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
