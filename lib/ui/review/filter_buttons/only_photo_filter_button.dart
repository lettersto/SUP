import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/review_filter.dart';
import '../../../providers/providers_exporter.dart';
import '../../../utils/styles.dart';
import '../../../utils/enums.dart';

import 'review_text_button.dart';

class OnlyPhotoFilterButton extends ConsumerStatefulWidget {
  const OnlyPhotoFilterButton({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnlyPhotoFilterButton();
}

class _OnlyPhotoFilterButton extends ConsumerState<OnlyPhotoFilterButton> {
  final int filterButtonIdx =
      ReviewFilters.reviewFilterTypeMap[ReviewFilterType.onlyPhotos];

  @override
  Widget build(BuildContext context) {
    bool isSelected =
        filterButtonIdx == ref.watch(selectedReviewFilterProvider);

    void tapHandler() {
      if (isSelected) {
        ref.read(selectedReviewFilterProvider.notifier).resetFilter();
      } else {
        ref
            .read(selectedReviewFilterProvider.notifier)
            .selectFilter(filterButtonIdx);
      }
    }

    return ReviewTextButton(
      text: '사진 리뷰만',
      tapHandler: tapHandler,
      icon:
          isSelected ? Icons.check_box : Icons.check_box_outline_blank_outlined,
      textColor: isSelected ? AppColors.pink40 : AppColors.gray,
    );
  }
}
