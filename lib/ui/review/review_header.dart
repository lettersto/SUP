import 'package:flutter/material.dart';

import '../../utils/styles.dart';
import '../common/headline.dart';
import '../common/line_divider.dart';
import '../common/search_bar.dart';
import './filter_buttons/review_text_button.dart';
import './filter_buttons/filter_toggle_button.dart';
import './filter_buttons/only_photo_filter_button.dart';
import './filter_buttons/tag_filtter_button.dart';

class ReviewHeader extends StatelessWidget {
  final int totalCount;

  const ReviewHeader({
    super.key,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: ReviewHeaderDelegate(totalCount),
    );
  }
}

class ReviewHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final int totalCount;

  ReviewHeaderDelegate(this.totalCount, [this.height = 50]);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    void navigateToReviewForm() {
      Navigator.pushNamed(
        context,
        '/review-form',
      );
    }

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(color: AppColors.white),
          height: height,
          child: LineDivider(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Headline(
                  title: '리뷰',
                  count: totalCount,
                ),
                ReviewTextButton(
                  text: '나도 참여',
                  tapHandler: navigateToReviewForm,
                  icon: Icons.create,
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(color: AppColors.white),
          height: height * 1.5,
          child: const LineDivider(
              child: SearchBar(
            icon: Icons.search,
            hintText: '원하는 리뷰를 검색해 보세요.',
          )),
        ),
        Container(
          decoration: const BoxDecoration(color: AppColors.white),
          height: height,
          child: LineDivider(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterToggleButton.fromStringTitle(
                  const ['별점순', '최신순'],
                ),
                const OnlyPhotoFilterButton(),
              ],
            ),
          ),
        ),
        Container(
          color: AppColors.white,
          height: height,
          child: TagFilterButton(),
        ),
      ],
    );
  }

  @override
  double get maxExtent => height * 4.5;

  @override
  double get minExtent => height * 4.5;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
