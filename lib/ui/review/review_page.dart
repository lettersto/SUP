import 'package:flutter/material.dart';

import './review_appbar.dart';
import './review_header.dart';
import './image_review_list.dart';
import './tag_chart/tag_chart.dart';
import './review_list/review_list.dart';

import './review_dummy.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const ReviewAppBar(storeName: '가게 이름'),
            const ReviewHeader(),
            const SliverToBoxAdapter(child: ImageReviewList()),
            TagChart(),
            ReviewList(reviews: reviewDummy),
          ],
        ),
      ),
    );
  }
}
