import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class Headline extends StatelessWidget {
  final String title;
  final int? count;
  final Color? textColor;

  const Headline({
    Key? key,
    required this.title,
    this.count,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,
            style: TextStyles.bold16
                .merge(TextStyle(color: textColor ?? AppColors.black))),
        if (count != null)
          const SizedBox(
            width: 4,
          ),
        if (count != null)
          Text(
            count.toString(),
            style: TextStyles.bold16
                .merge(const TextStyle(color: AppColors.pinkAccent)),
          ),
      ],
    );
  }
}
