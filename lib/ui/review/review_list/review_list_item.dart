import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/ui/review/review_list/review_list_top.dart';

import '../../../models/review.dart';
import '../../../utils/styles.dart';

import 'review_tags.dart';
import '../../common/image_slider.dart';
import 'review_text.dart';

final tagOpenProvider = StateProvider<bool>((ref) => false);

class ReviewListItem extends ConsumerWidget {
  final Review review;

  const ReviewListItem({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.grayTransparent)),
      ),
      child: Column(
        children: [
          const ReviewListTop(),
          ImageSlider(images: review.images),
          ReviewText.fromString(review.content),
          ReviewTags(tags: review.tags),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(review.createdDate.toString(),
                style: TextStyles.medium12
                    .merge(const TextStyle(color: AppColors.gray))),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
