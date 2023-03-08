import 'package:flutter/material.dart';

enum SizeType {
  extraLarge,
  large,
  medium,
  small,
  // extraSmall,
}

// TODO snap image to cetner
class ImageSlider extends StatelessWidget {
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
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          imageUrl,
                          height: height,
                        )),
                  ))
              .toList()
        ],
      ),
    );
  }
}
