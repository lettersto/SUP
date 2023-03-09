import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/dummy_api.dart';
import '../models/dummy.dart';

// ===== image review =====
final apiProvider = Provider<DummyApi>((ref) => DummyApi());
final imageReviewProvider = FutureProvider<List<ImageReview>>(
    (ref) => ref.read(apiProvider).getImageReviews());

// ===== filtering ======
class ReviewFilterNotifier extends Notifier<int> {
  @override
  int build() {
    return -1;
  }

  void selectFilter(int filterIndex) {
    state = filterIndex;
  }

  void resetFilter() {
    state = -1;
  }
}

final selectedReviewFilterProvider = NotifierProvider<ReviewFilterNotifier, int>(() => ReviewFilterNotifier());
