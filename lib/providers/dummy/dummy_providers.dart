import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/dummy_api.dart';
import '../../models/dummy/tag.dart';
import '../../models/dummy/dummy.dart';

// ===== image review =====
final apiProvider = Provider<DummyApi>((ref) => DummyApi());
final imageReviewProvider = FutureProvider<List<ImageReview>>(
    (ref) => ref.read(apiProvider).getImageReviews());

// ====== review form ======
class ReviewFormFieldNotifier extends Notifier<ReviewFormField> {
  @override
  ReviewFormField build() {
    return ReviewFormField();
  }

  void setStarRate(int newRate) {
    state.star = newRate;
  }

  void setContent(String newContent) {
    state.content = newContent;
  }

  void _addTags(ReviewTag tag) {
    state.tag = [...state.tag, tag.tagNo];
  }

  void _removeTags(ReviewTag tag) {
    state.tag = state.tag.where((tagNo) => tagNo != tag.tagNo).toList();
  }

  void setTag(ReviewTag selectedTag) {
    if (!state.tag.contains(selectedTag.tagNo) && state.tag.length < 5) {
      _addTags(selectedTag);
    } else {
      _removeTags(selectedTag);
    }
  }
}

final reviewFormFieldProvider =
    NotifierProvider<ReviewFormFieldNotifier, ReviewFormField>(
        ReviewFormFieldNotifier.new);

final reviewTagsProvider = Provider((ref) => ReviewTags.fromJson(tagData));
