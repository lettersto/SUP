import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/dummy/dummy_providers.dart';
import '../../../../models/dummy/tag.dart';
import '../../../../utils/styles.dart';

class TagSelectionItem extends ConsumerStatefulWidget {
  final ReviewTag tag;

  const TagSelectionItem({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  ConsumerState<TagSelectionItem> createState() => _TagSelectionItemState();
}

class _TagSelectionItemState extends ConsumerState<TagSelectionItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    void tapHandler() {
      setState(() {
        _isSelected =
            ref.watch(reviewFormFieldProvider).tag.contains(widget.tag.tagNo);
      });
      ref.read(reviewFormFieldProvider.notifier).setTag(widget.tag);
    }

    return GestureDetector(
      onTap: tapHandler,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color:
              ref.watch(reviewFormFieldProvider).tag.contains(widget.tag.tagNo)
                  ? AppColors.pink40
                  : AppColors.white,
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
          widget.tag.title,
          style: TextStyles.medium18,
        ),
      ),
    );
  }
}
