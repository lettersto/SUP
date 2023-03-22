import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/review/review_detail_provider.dart';
import '../../utils/styles.dart';
import './photo_review_content.dart';

class PhotoDetailPage extends ConsumerStatefulWidget {
  final int? imageNo;

  const PhotoDetailPage({
    super.key,
    this.imageNo = 0,
  });

  static const routeName = '/photo-detail';

  @override
  ConsumerState<PhotoDetailPage> createState() => _PhotoDetailPageState();
}

class _PhotoDetailPageState extends ConsumerState<PhotoDetailPage> {
  @override
  void initState() {
    super.initState();
    ref.read(reviewDetailProvider.notifier).getReviewDetail(widget.imageNo!);
  }

  @override
  Widget build(BuildContext context) {
    final review = ref.watch(reviewDetailProvider);
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
      ),
      backgroundColor: AppColors.black,
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        color: AppColors.black,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: deviceWidth,
              height: deviceHeight,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  review.img,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: deviceWidth,
                      height: 400,
                      color: AppColors.black,
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                )
              ],
            ),
            PhotoReviewContent(
              review: review,
            ),
            Positioned(
              bottom: 0,
              child: IgnorePointer(
                child: Container(
                  height: 80,
                  width: deviceWidth,
                  color: AppColors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
