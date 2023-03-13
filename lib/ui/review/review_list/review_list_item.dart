import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';
import '../../../models/dummy_review.dart';
import '../../../utils/styles.dart';
import '../../../utils/enums.dart';

import '../../common/image_slider.dart';
import './review_list_top.dart';
import './review_tags.dart';
import './review_text.dart';

final tagOpenProvider = StateProvider<bool>((ref) => false);

class ReviewListItem extends ConsumerWidget {
  final Review review;
  final ReviewMode mode;

  const ReviewListItem({
    Key? key,
    required this.review,
    this.mode = ReviewMode.main,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagColor = (mode == ReviewMode.detail)
        ? AppColors.grayTransparent30
        : AppColors.pink15;
    final tagTextColor =
        (mode == ReviewMode.detail) ? AppColors.white : AppColors.gray;
    final sliderSize =
        ref.watch(isFilterSelectedProvider(ReviewFilterType.onlyPhotos))
            ? SizeType.large
            : SizeType.medium;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.grayTransparent)),
      ),
      child: Column(
        children: [
          ReviewListTop(mode: mode),
          if (mode != ReviewMode.detail)
            ImageSlider(
              images: review.images,
              size: sliderSize,
            ),
          if (mode != ReviewMode.detail)
            ReviewText.forMain(review.content)
          else
            ReviewText.forDetail(review.content),
          ReviewTags(
            tags: review.tags,
            tagColor: tagColor,
            tagTextColor: tagTextColor,
            mode: mode,
          ),
          if (mode != ReviewMode.detail)
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(review.createdDate.toString(),
                  style: TextStyles.medium12
                      .merge(const TextStyle(color: AppColors.gray))),
            ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
