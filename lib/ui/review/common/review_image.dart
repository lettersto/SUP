import 'package:flutter/material.dart';
import 'package:sup/utils/enums.dart';

import '../../photo_detail/photo_detail_page.dart';

class ReviewImage extends StatelessWidget {
  final int loopIndex;
  final int loopLastIndex;
  final String imageUrl;
  final SizeType sizeType;
  final int? imgNo;

  final Map<SizeType, dynamic> _sizeMap = {
    SizeType.extraLarge: 0.5,
    SizeType.large: 0.3,
    SizeType.medium: 0.2,
    SizeType.small: 0.1,
    // SizeType.extraSmall: 0.05,
  };

  ReviewImage({
    Key? key,
    required this.loopIndex,
    required this.loopLastIndex,
    required this.imageUrl,
    required this.sizeType,
    this.imgNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * _sizeMap[sizeType];

    return Padding(
      padding: EdgeInsets.fromLTRB((loopIndex == 0 ? 16.0 : 0), 0,
          (loopIndex == loopLastIndex ? 16.0 : 4.0), 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, PhotoDetailPage.routeName,
            //     arguments: ScreenArguments(
            //       imgNo,
            //     ));
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
