import 'package:flutter/material.dart';

import '../../utils/app_utils.dart';
import '../../utils/styles.dart';

class ReviewFormAppBar extends StatelessWidget {
  final String storeName;

  const ReviewFormAppBar({
    super.key,
    required this.storeName,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.1;
    void goBack() {
      Navigator.pop(context);
    }

    return SliverAppBar(
      expandedHeight: height,
      collapsedHeight: height,
      backgroundColor: AppColors.white,
      pinned: true,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.grayTransparent,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storeName,
                  style: TextStyles.bold18,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  AppUtils.dateFormatter(),
                  style: TextStyles.medium14.merge(
                    const TextStyle(color: AppColors.gray),
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.close,
                size: 32,
                color: AppColors.black,
              ),
              onPressed: goBack,
            ),
          ],
        ),
      ),
    );
  }
}
