import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers_exporter.dart';
import '../../../models/review/review_filter.dart';
import '../../../utils/styles.dart';
import '../../../utils/enums.dart';

class FilterToggleButton extends ConsumerStatefulWidget {
  final List<Widget> titles;

  const FilterToggleButton._({Key? key, required this.titles})
      : super(key: key);

  FilterToggleButton.fromStringTitle(List<String> strLst, {super.key})
      : titles = strLst
            .map((str) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  '• $str',
                  style: TextStyles.medium14,
                )))
            .toList();

  @override
  ConsumerState<FilterToggleButton> createState() => _FilterToggleButtonState();
}

class _FilterToggleButtonState extends ConsumerState<FilterToggleButton> {
  @override
  Widget build(BuildContext context) {
    final int starRatingIdx =
        ReviewFilters.reviewFilterTypeMap[ReviewFilterType.starRating];
    final int latestIdx =
        ReviewFilters.reviewFilterTypeMap[ReviewFilterType.latest];

    var selectedIdx = ref.watch(selectedReviewFilterProvider);
    var isStarRatingSelected = starRatingIdx == selectedIdx;
    var isLatestSelected = latestIdx == selectedIdx;

    void pressHandler(int selectedIdx) {
      if (selectedIdx < 0 || selectedIdx > 2) {
        throw Exception('Filter Toggle Button: unknown selected index.');
      }

      ref.read(selectedReviewFilterProvider.notifier).resetFilter();

      if (selectedIdx == 0 && !isStarRatingSelected) {
        ref
            .read(selectedReviewFilterProvider.notifier)
            .selectFilter(starRatingIdx);
      }

      if (selectedIdx == 1 && !isLatestSelected) {
        ref.read(selectedReviewFilterProvider.notifier).selectFilter(latestIdx);
      }
    }

    return ToggleButtons(
      isSelected: [isStarRatingSelected, isLatestSelected],
      onPressed: pressHandler,
      renderBorder: false,
      color: AppColors.gray,
      fillColor: const Color.fromRGBO(0, 0, 0, 0),
      highlightColor: const Color.fromRGBO(0, 0, 0, 0),
      selectedColor: AppColors.pink40,
      children: widget.titles,
    );
  }
}
