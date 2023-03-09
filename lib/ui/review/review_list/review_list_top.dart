import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

import '../../common/headline.dart';
import '../filter_buttons/review_text_button.dart';

class ReviewListTop extends StatelessWidget {
  const ReviewListTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Headline(title: '배고파서 슬픈 고라니'),
              Text(
                '리뷰 10 사진 25',
                style: TextStyles.medium12.merge(
                  const TextStyle(
                    color: AppColors.gray,
                  ),
                ),
              )
            ],
          ),
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
