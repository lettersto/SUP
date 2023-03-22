import 'package:flutter/material.dart';

import '../../models/review/review.dart';
import 'review_detail_multiple_photo_item.dart';

class ReviewDetailMultiplePhotoBody extends StatefulWidget {
  final ReviewDetailWithPhotos review;

  const ReviewDetailMultiplePhotoBody({
    super.key,
    required this.review,
  });

  @override
  State<ReviewDetailMultiplePhotoBody> createState() =>
      _ReviewDetailMultiplePhotoBodyState();
}

class _ReviewDetailMultiplePhotoBodyState
    extends State<ReviewDetailMultiplePhotoBody> {
  Offset _offset = const Offset(0, 0.5);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 0,
      child: Container(
        width: deviceWidth,
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.only(bottom: 40),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onVerticalDragUpdate: (details) {
            if (details.delta.direction > 0) {
              setState(() {
                _offset = const Offset(0, 0.5);
              });
            } else {
              setState(() {
                _offset = Offset.zero;
              });
            }
          },
          child: AnimatedSlide(
            offset: _offset,
            duration: const Duration(microseconds: 350),
            curve: Curves.easeInOut,
            child: IgnorePointer(
              child: ReviewDetailMultiplePhotoItem(
                review: widget.review,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
