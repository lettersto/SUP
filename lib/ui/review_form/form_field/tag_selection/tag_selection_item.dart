import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/dummy/tag.dart';
import '../../../../providers/review/review_form_provider.dart';
import '../../../../utils/styles.dart';

class TagSelectionItem extends ConsumerWidget {
  final ReviewTag tag;

  const TagSelectionItem({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isSelected = ref.watch(reviewFormProvider).tags.contains(tag.tagNo);

    void tapHandler() {
      ref.read(reviewFormProvider.notifier).setTags(tag.tagNo);
    }

    return GestureDetector(
      onTap: tapHandler,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.pink40 : AppColors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(1, 3),
            ),
          ],
        ),
        // padding: EdgeInsets.all(20.0),
        child: Text(
          tag.title,
          style: TextStyles.medium18,
        ),
      ),
    );
  }
}
