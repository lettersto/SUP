import 'package:flutter/material.dart';

import '../../models/review/review.dart';
import '../../utils/styles.dart';
import 'review_detail_multiple_photo_body.dart';
import '../photo_detail/photo_detail_slider.dart';

class ReviewDetailMultiplePhotoPage extends StatefulWidget {
  final List<String> images;
  final ReviewDetailWithPhotos? review;

  const ReviewDetailMultiplePhotoPage({
    super.key,
    required this.images,
    this.review,
  });

  static const routeName = '/multiple-photo-detail';

  @override
  State<ReviewDetailMultiplePhotoPage> createState() =>
      _ReviewDetailMultiplePhotoPageState();
}

class _ReviewDetailMultiplePhotoPageState
    extends State<ReviewDetailMultiplePhotoPage> {
  int _currentPage = 1;

  void _setCurrentPage(double pageIdx) {
    setState(() {
      if (pageIdx < 0 || pageIdx >= widget.images.length) return;
      _currentPage = pageIdx.floor() + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 16.0),
            alignment: Alignment.center,
            child: Text(
              '$_currentPage / ${widget.images.length}',
              style: TextStyles.medium14
                  .merge(const TextStyle(color: AppColors.white)),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.black,
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        alignment: Alignment.center,
        color: AppColors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: deviceHeight,
              width: deviceWidth,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: deviceHeight - 400,
                  child: PhotoDetailSlider(
                    imgUrls: widget.images,
                    setCurrentPage: _setCurrentPage,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
              ],
            ),
            ReviewDetailMultiplePhotoBody(
              review: widget.review!,
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
