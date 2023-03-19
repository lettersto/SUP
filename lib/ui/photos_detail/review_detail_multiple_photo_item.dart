import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/review/review.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/styles.dart';
import '../../../utils/enums.dart';
import '../review/review_list/review_list_top.dart';
import '../review/review_list/review_text.dart';
import '../review/review_list/review_tags.dart';

final tagOpenProvider = StateProvider<bool>((ref) => false);

class ReviewDetailMultiplePhotoItem extends ConsumerWidget {
  final ReviewDetailWithPhotos review;

  const ReviewDetailMultiplePhotoItem({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const tagColor = AppColors.grayTransparent30;
    const tagTextColor = AppColors.white;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(201, 0, 0, 0),
            Color.fromARGB(151, 0, 0, 0),
            Color.fromARGB(0, 0, 0, 0),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewListTop(
            mode: ReviewMode.detail,
            nickname: review.nickname,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${AppUtils.dateFormatter(review.regDtm)} 방문',
                style: TextStyles.medium14
                    .merge(const TextStyle(color: AppColors.gray)),
              ),
              const SizedBox(
                width: 4,
              ),
              const Icon(
                Icons.star_rounded,
                color: AppColors.pink40,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                review.star.toString(),
                style: TextStyles.medium14
                    .merge(const TextStyle(color: AppColors.pink20)),
              )
            ],
          ),
          ReviewText.forDetail(review.content),
          ReviewTags(
            tags: review.tags,
            tagColor: tagColor,
            tagTextColor: tagTextColor,
            mode: ReviewMode.detail,
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
