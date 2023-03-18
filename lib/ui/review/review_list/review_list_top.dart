import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/common/cursor_pagination_model.dart';
import '../../../models/review/like_param.dart';
import '../../../providers/common/pagination_provider.dart';
import '../../../providers/review/review_provider.dart';
import '../../../utils/sharedPreference_util.dart';
import '../../../utils/enums.dart';
import '../../../utils/styles.dart';
import '../../common/headline.dart';
import '../filter_buttons/review_text_button.dart';

class ReviewListTop extends ConsumerWidget {
  final String nickname;
  final double? starAvg;
  final int? reviewCnt;
  final int? reviewNo;
  final ReviewMode mode;
  final bool? isLike;
  final StateNotifierProvider<PaginationProvider, CursorPaginationBase>?
      provider;
  final int? reviewItemidx;

  const ReviewListTop({
    Key? key,
    required this.mode,
    required this.nickname,
    this.reviewNo,
    this.starAvg,
    this.reviewCnt,
    this.isLike,
    this.provider,
    this.reviewItemidx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textColor =
        mode == ReviewMode.detail ? AppColors.white : AppColors.black;
    final paddingVertical = mode == ReviewMode.detail ? 8.0 : 16.0;

    Future<void> markHelpful() async {
      if (reviewNo == null) return;
      try {
        await ref.watch(reviewClientProvider).markLike(LikeParam(
            userNo: SharedPreferenceUtil().userNo, reviewNo: reviewNo!));
        ref
            .read(provider!.notifier)
            .changeIsLikeState(itemIdx: reviewItemidx!, valueToChange: true);
      } catch (err) {
        print(err);
      }
    }

    Future<void> removeHelpful() async {
      if (reviewNo == null) return;
      try {
        await ref.watch(reviewClientProvider).removeLike(
            userNo: SharedPreferenceUtil().userNo, reviewNo: reviewNo!);
        ref
            .read(provider!.notifier)
            .changeIsLikeState(itemIdx: reviewItemidx!, valueToChange: false);
      } catch (err) {
        print(err);
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingVertical),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headline(
                title: nickname,
                textColor: textColor,
              ),
              if (reviewCnt != null && starAvg != null)
                Text(
                  '리뷰 $reviewCnt / 평균 별점 $starAvg',
                  style: TextStyles.medium12.merge(
                    TextStyle(
                      color: textColor,
                    ),
                  ),
                )
            ],
          ),
          if (mode == ReviewMode.main)
            ReviewTextButton(
              text: '도움 돼요!',
              tapHandler: isLike! ? removeHelpful : markHelpful,
              textColor: isLike! ? AppColors.pink60 : AppColors.gray,
            ),
        ],
      ),
    );
  }
}
