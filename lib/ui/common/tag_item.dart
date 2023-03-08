import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class TagItem extends StatelessWidget {
  final Map<String, String> tag;

  const TagItem({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.pink15, borderRadius: BorderRadius.circular(4.0)),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Text(
        '${tag['emoji']} ${tag['title']}',
        style: TextStyles.medium14.merge(
          const TextStyle(color: AppColors.gray),
        ),
      ),
    );
  }
}
