import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/models/common/pagination_params.dart';

import '../../models/common/cursor_pagination_model.dart';
import '../../models/review/review.dart';
import '../../repositories/review/review_repository.dart';
import '../common/common_provider.dart';
import '../common/pagination_provider.dart';

// T와 U에 값을 집어 넣는 과정
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
      paginationQueryParams: params.paginationQueryParams); // 여기에서 외부에서 값을 받아옴

  return notifier;
});

final reviewClientProvider = Provider<ReviewClient>((ref) {
  final dio = ref.watch(dioProvider);
  return ReviewClient(dio);
});
