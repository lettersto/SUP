import 'package:flutter/material.dart';

import '../../../models/review/tag_chart.dart';
import '../../../utils/styles.dart';

class TagChartBar extends StatelessWidget {
  final TagChartItemModel tag;
  final int totalCnt;

  const TagChartBar({
    Key? key,
    required this.tag,
    required this.totalCnt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percentage = 0;
    if (totalCnt != 0) {
      percentage = tag.tagCnt / totalCnt;
    }

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          decoration: BoxDecoration(
            color: AppColors.pink15,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        FractionallySizedBox(
          widthFactor: percentage,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            margin: const EdgeInsets.symmetric(vertical: 2.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(250, 173, 202, percentage),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tag.value,
                style: TextStyles.bold16,
              ),
              Text(
                '250',
                style: TextStyles.medium16.merge(
                  const TextStyle(color: AppColors.pink30),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
