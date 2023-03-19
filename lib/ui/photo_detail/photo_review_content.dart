import 'package:flutter/material.dart';

import '../../models/review/review.dart';
import '../../utils/enums.dart';
import './photo_review_content_item.dart';

class PhotoReviewContent extends StatefulWidget {
  final ReviewDetail review;

  const PhotoReviewContent({
    super.key,
    required this.review,
  });

  @override
  State<PhotoReviewContent> createState() => _PhotoReviewContentState();
}

class _PhotoReviewContentState extends State<PhotoReviewContent> {
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
            child: const PhotoReviewContentItem(
              mode: ReviewMode.photoOnly,
            ),
          ),
        ),
      ),
    );
  }
}
