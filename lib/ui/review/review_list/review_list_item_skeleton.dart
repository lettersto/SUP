import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class ReviewListItemSkeleton extends StatelessWidget {
  final double imageSlidePercentage;

  const ReviewListItemSkeleton({
    Key? key,
    this.imageSlidePercentage = 0.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageSlideHeight =
        MediaQuery.of(context).size.height * imageSlidePercentage;
    final deviceWidth = MediaQuery.of(context).size.width;
    const double itemHeight = 20;
    const double commonWidth = 96;
    const Color color = AppColors.grayTransparent2;

    Widget renderContainer(double width) {
      return Container(
        height: itemHeight,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(4.0)),
      );
    }

    Widget renderBlankLine() {
      return const SizedBox(
        height: 8,
      );
    }

    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    renderContainer(commonWidth),
                    renderBlankLine(),
                    renderContainer(160),
                  ],
                ),
                renderContainer(commonWidth),
              ],
            ),
          ),
          renderBlankLine(),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: imageSlideHeight,
                  width: (deviceWidth - 32) * 0.54,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(8.0)),
                ),
                Container(
                  height: imageSlideHeight,
                  width: (deviceWidth - 32) * 0.45,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(8.0)),
                ),
              ],
            ),
          ),
          renderBlankLine(),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8.0)),
          ),
          renderBlankLine(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              renderContainer(commonWidth),
              const SizedBox(width: 8.0),
              renderContainer(itemHeight),
            ],
          ),
          renderBlankLine(),
          renderContainer(commonWidth),
        ],
      ),
    );
  }
}
