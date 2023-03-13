import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class PhotoDetailSlider extends StatefulWidget {
  final List<String> imgUrls;
  final Function setCurrentPage;

  const PhotoDetailSlider({
    super.key,
    required this.imgUrls,
    required this.setCurrentPage,
  });

  @override
  State<PhotoDetailSlider> createState() => _PhotoDetailSliderState();
}

class _PhotoDetailSliderState extends State<PhotoDetailSlider> {
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.setCurrentPage(_controller.page);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: widget.imgUrls.length,
      itemBuilder: (context, idx) {
        return Image.network(
          widget.imgUrls[idx],
          fit: BoxFit.fitWidth,
          loadingBuilder: ((context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            // TODO implement loading later
            return Container(
              width: double.infinity,
              height: 400,
              color: AppColors.grayTransparent30,
            );
          }),
        );
      },
    );
  }
}
