import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/dummy_providers.dart';
import '../../../../utils/styles.dart';
import 'tag_selection_item.dart';

class TagSelectionColumn extends ConsumerWidget {
  final String category;

  const TagSelectionColumn({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTags = ref.watch(reviewTagsProvider);

    return Padding(
      padding: const EdgeInsets.only(right: 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: TextStyles.medium20,
          ),
          const SizedBox(height: 32,),
          ...allTags
              .getTagsPerCategory(category)
              .map((tag) => TagSelectionItem(tag: tag))
              .toList()
        ],
      ),
    );
  }
}
