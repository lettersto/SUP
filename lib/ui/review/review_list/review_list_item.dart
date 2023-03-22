import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/common/cursor_pagination_model.dart';
import '../../../providers/providers_exporter.dart';
import '../../../models/review/review.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/styles.dart';
import '../../../utils/enums.dart';

import '../../common/image_slider.dart';
import './review_list_top.dart';
import './review_tags.dart';
import './review_text.dart';

final tagOpenProvider = StateProvider<bool>((ref) => false);

class ReviewListItem extends ConsumerWidget {
  final ReviewDetailWithPhotos review;
  final ReviewMode mode;
  final int reviewItemIdx;

  const ReviewListItem({
    Key? key,
    required this.review,
    this.mode = ReviewMode.main,
    this.reviewItemIdx = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagColor = (mode == ReviewMode.detail)
        ? AppColors.grayTransparent30
        : AppColors.pink15;
    final tagTextColor =
        (mode == ReviewMode.detail) ? AppColors.white : AppColors.gray;
    final sliderSize = ref.watch(reviewFilterOnlyPhotoProvider)
        ? SizeType.large
        : SizeType.medium;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.grayTransparent)),
      ),
      child: Column(
        children: [
          ReviewListTop(
            mode: mode,
            nickname: review.nickname,
            starAvg: review.starAvg,
            reviewCnt: review.reviewCnt,
            reviewNo: review.id,
            isLike: review.isLike,
            reviewItemIdx: reviewItemIdx,
            star: review.star,
            likeCnt: review.likeCnt,
          ),
          if (mode != ReviewMode.detail && review.imgs.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ImageSlider(
                review: review,
                images: review.imgs,
                size: sliderSize,
              ),
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
              child: Text(AppUtils.dateFormatter(review.regDtm),
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
