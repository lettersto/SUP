import 'package:flutter/material.dart';

import '../../../../utils/styles.dart';

import 'star_rating.dart';

class StarRatingArea extends StatelessWidget {
  const StarRatingArea({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.30;

    return Container(
      height: height,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '얼마나 좋았나요?',
            style: TextStyles.bold24,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            '좋았던 만큼 별로 표현해 주세요! (1~5점)',
            style: TextStyles.medium16.merge(
              const TextStyle(
                color: AppColors.gray,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const StarRating(),
        ],
      ),
    );
  }
}
