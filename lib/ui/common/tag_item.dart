import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class TagItem extends StatelessWidget {
  final Map<String, String> tag;
  final Color tagColor;
  final Color tagTextColor;

  const TagItem({
    super.key,
    required this.tag,
    required this.tagColor,
    required this.tagTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: tagColor, borderRadius: BorderRadius.circular(4.0)),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Text(
        '${tag['emoji']} ${tag['title']}',
        style: TextStyles.medium14.merge(
          TextStyle(color: tagTextColor),
        ),
      ),
    );
  }
}
