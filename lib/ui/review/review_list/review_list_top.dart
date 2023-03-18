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
  final int? star;
  final StateNotifierProvider<PaginationProvider, CursorPaginationBase>?
      provider;
  final int? reviewItemIdx;

  const ReviewListTop({
    Key? key,
    required this.mode,
    required this.nickname,
    this.reviewNo,
    this.starAvg,
    this.reviewCnt,
    this.isLike,
    this.provider,
    this.reviewItemIdx,
    this.star,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleColor =
        (mode == ReviewMode.detail || mode == ReviewMode.photoOnly)
            ? AppColors.white
            : AppColors.black;
    final subTitleColor =
        (mode == ReviewMode.detail || mode == ReviewMode.photoOnly)
            ? AppColors.white
            : AppColors.gray;
    final paddingVertical =
        (mode == ReviewMode.detail || mode == ReviewMode.photoOnly)
            ? 8.0
            : 16.0;

    Future<void> markHelpful() async {
      if (reviewNo == null) return;
      try {
        await ref.watch(reviewClientProvider).markLike(LikeParam(
            userNo: SharedPreferenceUtil().userNo, reviewNo: reviewNo!));
        ref
            .read(provider!.notifier)
            .changeIsLikeState(itemIdx: reviewItemIdx!, valueToChange: true);
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
            .changeIsLikeState(itemIdx: reviewItemIdx!, valueToChange: false);
      } catch (err) {
        print(err);
      }
    }

    return Container(
      margin: EdgeInsets.only(top: paddingVertical),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Headline(
                    title: nickname,
                    textColor: titleColor,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  if (mode == ReviewMode.main)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.pink40,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          star.toString(),
                          style: TextStyles.medium14
                              .merge(const TextStyle(color: AppColors.pink40)),
                        )
                      ],
                    )
                ],
              ),
              if (reviewCnt != null && starAvg != null)
                Text(
                  '리뷰 $reviewCnt / 평균 별점 $starAvg',
                  style: TextStyles.medium12.merge(
                    TextStyle(
                      color: subTitleColor,
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
