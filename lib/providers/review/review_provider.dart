import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common/cursor_pagination_model.dart';
import '../../models/common/pagination_params.dart';
import '../../models/review/review.dart';
import '../../repositories/review/review_repository.dart';
import '../common/pagination_provider.dart';

class ReviewStateNotifier
    extends PaginationProvider<ReviewDetailWithPhotos, ReviewRepository> {
  ReviewStateNotifier({required super.repository});
}

final reviewProvider = StateNotifierProvider.family<ReviewStateNotifier,
    CursorPaginationBase, ReviewDetailParams>((ref, ReviewDetailParams params) {
  final repository = ref.watch(reviewRepositoryProvider(params));
  final notifier = ReviewStateNotifier(repository: repository);

  return notifier;
});
