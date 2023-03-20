import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/review/review.dart';
import '../../repositories/review/review_repository.dart';
import 'review_provider.dart';

final reviewDetailProvider =
    StateNotifierProvider<ReviewDetailNotifier, ReviewDetail>((ref) {
  final reviewClient = ref.watch(reviewClientProvider);
  return ReviewDetailNotifier(reviewClient: reviewClient);
});

class ReviewDetailNotifier extends StateNotifier<ReviewDetail> {
  final ReviewClient reviewClient;

  ReviewDetailNotifier({
    required this.reviewClient,
  }) : super(ReviewDetail(
            userNo: 0,
            nickname: '',
            reviewNo: 0,
            regDtm: '',
            img: '',
            content: '',
            star: 0,
            tags: []));

  void getReviewDetail(int reviewImgNo) async {
    try {
      state = await reviewClient.getReviewDetail(reviewImgNo: reviewImgNo);
    } catch (err) {
      print(err);
    }
  }
}
