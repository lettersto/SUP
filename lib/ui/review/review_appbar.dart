import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class ReviewAppBar extends StatelessWidget {
  final String storeName;

  const ReviewAppBar({
    Key? key,
    required this.storeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(storeName),
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      snap: true,
      floating: true,
    );
  }
}
