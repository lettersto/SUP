import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/providers/review/review_detail_provider.dart';
import 'package:sup/utils/app_utils.dart';

import '../../../utils/styles.dart';
import '../../../utils/enums.dart';
import '../review/review_list/review_list_top.dart';
import '../review/review_list/review_text.dart';
import 'package:sup/ui/review/review_list/review_tags.dart';

final tagOpenProvider = StateProvider<bool>((ref) => false);

class PhotoReviewContentItem extends ConsumerWidget {
  final ReviewMode mode;

  const PhotoReviewContentItem({
    Key? key,
    this.mode = ReviewMode.main,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final review = ref.watch(reviewDetailProvider);
    const tagColor = AppColors.grayTransparent30;
    const tagTextColor = AppColors.white;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.grayTransparent)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewListTop(
            mode: mode,
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
            mode: mode,
          ),
        ],
      ),
    );
  }
}
