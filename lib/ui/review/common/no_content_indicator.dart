import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class NoContentIndicator extends StatelessWidget {
  final double height;
  final String message;

  const NoContentIndicator({
    Key? key,
    required this.height,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.pink15,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          message,
          style: TextStyles.medium16
              .merge(const TextStyle(color: AppColors.black)),
          textAlign: TextAlign.center,
        ));
  }
}
