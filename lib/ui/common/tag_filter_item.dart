import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class TagFilterItem extends StatelessWidget {
  final String tag;
  final bool shadow;
  final Color background;

  const TagFilterItem(
      {super.key,
      required this.tag,
      required this.shadow,
      required this.background});

  @override
  Widget build(BuildContext context) {
    return shadow
        ? Container(
            margin: const EdgeInsets.fromLTRB(3, 8, 3, 12),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 2,
                offset: const Offset(0, 3),
              )
            ], color: background, borderRadius: BorderRadius.circular(20.0)),
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Text(
              tag,
              style: TextStyles.regular14.merge(
                const TextStyle(color: AppColors.black),
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
                color: background, borderRadius: BorderRadius.circular(20.0)),
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Text(
              tag,
              style: TextStyles.regular14.merge(
                const TextStyle(color: AppColors.black),
              ),
            ),
          );
  }
}
