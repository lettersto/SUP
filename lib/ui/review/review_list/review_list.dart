import 'package:flutter/material.dart';
import 'package:sup/ui/review/review_list/review_list_item.dart';

import '../../../models/review.dart';

class ReviewList extends StatelessWidget {
  final List<Review> reviews;

  const ReviewList({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, itemIdx) {
          return ReviewListItem(review: reviews[itemIdx]);
        },
        childCount: reviews.length,
      ),
    );
  }
}
