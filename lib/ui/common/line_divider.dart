import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class LineDivider extends StatelessWidget {
  final Widget child;

  const LineDivider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.grayTransparent))),
      child: child,
    );
  }
}
