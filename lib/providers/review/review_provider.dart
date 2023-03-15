import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common/cursor_pagination_model.dart';
import '../../models/common/pagination_params.dart';
import '../../models/review/review.dart';
import '../../repositories/review/review_repository.dart';
import '../common/pagination_provider.dart';

class PaginatedReviewStateNotifier extends PaginationProvider<
    ReviewDetailWithPhotos, PaginatedReviewRepository> {
  PaginatedReviewStateNotifier({required super.repository});
}

final paginatedReviewProvider = StateNotifierProvider.family<
    PaginatedReviewStateNotifier,
    CursorPaginationBase,
    ReviewDetailParams>((ref, ReviewDetailParams params) {
  final repository = ref.watch(reviewRepositoryProvider(params));
  final notifier = PaginatedReviewStateNotifier(repository: repository);

  return notifier;
});
