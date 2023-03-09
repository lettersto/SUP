import 'package:flutter/material.dart';

import '../../utils/styles.dart';
import '../common/headline.dart';
import '../common/line_divider.dart';
import '../common/search_bar.dart';
import 'filter_buttons/review_text_button.dart';
import './filter_buttons/filter_toggle_button.dart';
import './filter_buttons/only_photo_filter_button.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: ReviewHeaderDelegate(),
    );
  }
}

class ReviewHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  ReviewHeaderDelegate([this.height = 50]);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(color: AppColors.white),
          height: height,
          child: LineDivider(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Headline(
                  title: '리뷰',
                  count: 220,
                ),
                ReviewTextButton(
                    text: '나도 참여', tapHandler: () {}, icon: Icons.create),
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
          decoration: const BoxDecoration(color: AppColors.pink10),
          height: height,
          // TODO implement tag filter
          // child: LineDivider(
          //   child: FilterToggleButton.fromStringTitle(
          //     const ['인테리어', '대화', '특별한메뉴', '사진맛집', '뷰맛집', '주차'],
          //   ),
          // ),
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
