import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/dummy/dummy_providers.dart';
import '../../../../utils/styles.dart';

import '../tag_selection/tag_selection_column.dart';

class TagSelectionArea extends ConsumerWidget {
  static const _categoryType = ['음식/가격', '분위기', '편의시설/기타'];

  const TagSelectionArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var height = MediaQuery.of(context).size.height;
    final allTags = ref.watch(reviewTagsProvider);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      color: AppColors.pink10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 56.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '어떤 점이 좋았나요? ',
                  style: TextStyles.bold24,
                ),
                Text(
                  '(1개~5개)',
                  style: TextStyles.bold14,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: height * 0.45,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: _categoryType
                    .map((ct) => TagSelectionColumn(
                          category: ct,
                        ))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
