import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers_exporter.dart';
import '../../../utils/styles.dart';
import './review_text_button.dart';

class OnlyPhotoFilterButton extends ConsumerStatefulWidget {
  const OnlyPhotoFilterButton({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnlyPhotoFilterButton();
}

class _OnlyPhotoFilterButton extends ConsumerState<OnlyPhotoFilterButton> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = ref.watch(reviewFilterOnlyPhotoProvider);

    void tapHandler() {
      ref.read(reviewFilterOnlyPhotoProvider.notifier).toggle();
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
