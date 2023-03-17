import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers_exporter.dart';
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
    var selectedFilter = ref.watch(reviewFilterStarRegDtmProvider);
    var isStarRatingSelected =
        selectedFilter == ReviewFilterStarRegDtmType.STAR;
    var isLatestSelected = selectedFilter == ReviewFilterStarRegDtmType.REGDTM;

    var transparent = const Color.fromRGBO(0, 0, 0, 0);

    void pressHandler(int selectedIdx) {
      if (selectedIdx == 0) {
        ref
            .read(reviewFilterStarRegDtmProvider.notifier)
            .setType(ReviewFilterStarRegDtmType.STAR);
      } else {
        ref
            .read(reviewFilterStarRegDtmProvider.notifier)
            .setType(ReviewFilterStarRegDtmType.REGDTM);
      }
    }

    return ToggleButtons(
      isSelected: [isStarRatingSelected, isLatestSelected],
      onPressed: pressHandler,
      renderBorder: false,
      color: AppColors.gray,
      fillColor: transparent,
      highlightColor: transparent,
      focusColor: transparent,
      splashColor: transparent,
      selectedColor: AppColors.pink40,
      children: widget.titles,
    );
  }
}
