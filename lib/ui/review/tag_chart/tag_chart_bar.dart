import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/providers/review/review_provider.dart';

import '../../../models/review/tag_chart.dart';
import '../../../utils/styles.dart';

class TagChartBar extends ConsumerWidget {
  final TagChartItemModel tag;

  const TagChartBar({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalCnt = ref.read(reviewTotalCountProvider);

    double percentage = 0;
    if (totalCnt != 0) {
      percentage = tag.tagCnt / totalCnt;
    }

    return SizedBox(
      height: 48,
      child: Stack(
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
                  tag.tagCnt.toString(),
                  style: TextStyles.medium16.merge(
                    const TextStyle(color: AppColors.pink40),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
