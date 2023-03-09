import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class ReviewTextButton extends StatelessWidget {
  final String text;
  final VoidCallback tapHandler;
  final IconData? icon;
  final Color? textColor;

  const ReviewTextButton({
    Key? key,
    required this.text,
    required this.tapHandler,
    this.icon,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null)
          GestureDetector(
            onTap: tapHandler,
            child: Icon(
              icon,
              color: AppColors.pink40,
              size: 16,
            ),
          ),
        TextButton(
            onPressed: tapHandler,
            child: Text(
              text,
              style: TextStyles.medium14
                  .merge(TextStyle(color: textColor ?? AppColors.black)),
            )),
      ],
    );
  }
}
