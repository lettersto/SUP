import 'package:flutter/material.dart';
import 'package:sup/models/review/review.dart';

import '../../utils/enums.dart';
import '../../utils/styles.dart';
import '../photos_detail/review_detail_multiple_photo_page.dart';

class ImageSlider extends StatelessWidget {
  final ReviewDetailWithPhotos review;
  final List<String> images;
  final SizeType size;

  static const Map<SizeType, dynamic> _sizeMap = {
    SizeType.extraLarge: 0.5,
    SizeType.large: 0.3,
    SizeType.medium: 0.2,
    SizeType.small: 0.1,
    // SizeType.extraSmall: 0.05,
  };

  const ImageSlider({
    super.key,
    required this.review,
    required this.images,
    this.size = SizeType.medium,
  });

  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height * ImageSlider._sizeMap[size];

    return SizedBox(
      height: height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...images
              .map((imageUrl) => Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ReviewDetailMultiplePhotoPage(
                                  images: images,
                                  review: review,
                                )));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          imageUrl,
                          height: height,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                  3,
                                  (index) => Container(
                                        color: AppColors.grayTransparent2,
                                        height: height,
                                        width: height,
                                        margin:
                                            const EdgeInsets.only(right: 4.0),
                                      )),
                            );
                          },
                        ),
                      ),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
