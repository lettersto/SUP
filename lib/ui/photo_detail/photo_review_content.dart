import 'package:flutter/material.dart';

import '../../utils/enums.dart';

import '../review/review_list/review_list_item.dart';
import '../review/review_dummy.dart';

class PhotoReviewContent extends StatefulWidget {
  final Function setIsOpen;

  const PhotoReviewContent({
    super.key,
    required this.setIsOpen,
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
      width: deviceWidth,
      bottom: 0,
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(201, 0, 0, 0),
              Color.fromARGB(151, 0, 0, 0),
              Color.fromARGB(0, 0, 0, 0),
            ],
          ),
        ),
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.direction > 0) {
              setState(() {
                _offset = const Offset(0, 0.5);
                widget.setIsOpen(false);
              });
            } else {
              setState(() {
                _offset = Offset.zero;
                widget.setIsOpen(true);
              });
            }
          },
          child: AnimatedSlide(
            offset: _offset,
            duration: const Duration(microseconds: 350),
            curve: Curves.easeInOut,
            child: ReviewListItem(
              review: reviewDummy[0],
              mode: ReviewMode.detail,
            ),
          ),
        ),
      ),
    );
  }
}
