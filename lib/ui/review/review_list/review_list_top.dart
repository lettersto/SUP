import 'package:flutter/material.dart';

import '../../../utils/enums.dart';
import '../../../utils/styles.dart';

import '../../common/headline.dart';
import '../filter_buttons/review_text_button.dart';

class ReviewListTop extends StatelessWidget {
  final String nickname;
  final double starAvg;
  final int reviewCnt;
  final ReviewMode mode;

  const ReviewListTop({
    Key? key,
    required this.mode,
    required this.nickname,
    required this.starAvg,
    required this.reviewCnt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor =
        mode == ReviewMode.detail ? AppColors.white : AppColors.black;
    final paddingVertical = mode == ReviewMode.detail ? 8.0 : 16.0;

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
              tapHandler: () {},
              textColor: AppColors.pink60,
            ),
        ],
      ),
    );
  }
}
