import 'dart:ui';
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
  bool _isOpen = false;

  void _setIsOpen(bool isOpen) {
    setState(() {
      _isOpen = isOpen;
    });
  }

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
        color: AppColors.black,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Image.network(
              review.img,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: deviceWidth,
                  height: deviceHeight / 2,
                  color: AppColors.black,
                );
              },
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
            PhotoReviewContent(
              review: review,
              setIsOpen: _setIsOpen,
            ),
            if (!_isOpen)
              Positioned(
                bottom: -20,
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
