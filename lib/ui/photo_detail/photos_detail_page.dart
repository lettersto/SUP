import 'dart:ui';
import 'package:flutter/material.dart';

import '../../models/review/review.dart';
import '../../utils/styles.dart';
import './photos_review_content.dart';

import './photo_detail_slider.dart';

class PhotosDetailPage extends StatefulWidget {
  final List<String> images;
  final ReviewDetailWithPhotos? review;

  const PhotosDetailPage({
    super.key,
    required this.images,
    this.review,
  });

  static const routeName = '/photos-detail';

  @override
  State<PhotosDetailPage> createState() => _PhotosDetailPageState();
}

class _PhotosDetailPageState extends State<PhotosDetailPage> {
  int _currentPage = 1;
  bool _isOpen = false;

  void _setCurrentPage(double pageIdx) {
    setState(() {
      if (pageIdx < 0 || pageIdx >= widget.images.length) return;
      _currentPage = pageIdx.floor() + 1;
    });
  }

  void _setIsOpen(bool isOpen) {
    setState(() {
      _isOpen = isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

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
        color: AppColors.black,
        alignment: Alignment.center,
        child: Stack(
          children: [
            PhotoDetailSlider(
              imgUrls: widget.images,
              setCurrentPage: _setCurrentPage,
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 0.0,
                    sigmaY: 0.0,
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(_isOpen ? .2 : 0),
                  ),
                ),
              ),
            ),
            // TODO change types
            // PhotosReviewContent(
            //   review: widget.review!,
            //   setIsOpen: _setIsOpen,
            // ),
            if (!_isOpen)
              Positioned(
                bottom: 0,
                left: 0,
                width: deviceWidth,
                height: 40,
                child: ClipRect(
                  child: IgnorePointer(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 0.8,
                        sigmaY: 0.0,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.topCenter,
                            colors: [
                              Color.fromARGB(177, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0),
                            ],
                          ),
                        ),
                        // color: Color.fromARGB(0, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
