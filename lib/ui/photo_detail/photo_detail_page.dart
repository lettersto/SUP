import 'dart:ui';
import 'package:flutter/material.dart';

import '../../utils/styles.dart';

import './photo_detail_slider.dart';
import './photo_review_content.dart';

class PhotoDetailPage extends StatefulWidget {
  const PhotoDetailPage({super.key});

  static const routeName = '/photo-detail';

  @override
  State<PhotoDetailPage> createState() => _PhotoDetailPageState();
}

class _PhotoDetailPageState extends State<PhotoDetailPage> {
  int _currentPage = 1;
  bool _isOpen = false;

  final _dummyImageUrls = [
    'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80',
    'https://images.unsplash.com/photo-1506368249639-73a05d6f6488?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
    'https://images.unsplash.com/photo-1577636706176-abbd9a011951?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
  ];

  void _setCurrentPage(double pageIdx) {
    setState(() {
      if (pageIdx < 0 || pageIdx >= _dummyImageUrls.length) return;
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
              '$_currentPage / ${_dummyImageUrls.length}',
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
              imgUrls: _dummyImageUrls,
              setCurrentPage: _setCurrentPage,
            ),
            // TODO hit gesture translucent
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
              setIsOpen: _setIsOpen,
            ),
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
