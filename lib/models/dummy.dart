import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageReview {
  final String imageUrl;

  const ImageReview({required this.imageUrl});

  // TODO change fromJSON with actual api
  factory ImageReview.fromJson(Map<String, dynamic> json) {
    return ImageReview(imageUrl: json['avatar']);
  }
}

// ====== filtering =======
class ReviewFilters {
  static const reviewFilterTypeList = [
    'starRating',
    'latest',
    'onlyPhotos',
    'interior',
    'conversation',
    'speciality',
    'photoZone',
    'niceView',
    'parkingLot',
  ];

  // NOTE Map<String, int>로 되지 않는다.
  static Map<dynamic, dynamic> get reviewFilterTypeMap {
    final typeToIntMap = {};

    for (var idx = 0; idx < reviewFilterTypeList.length; idx++) {
      typeToIntMap[reviewFilterTypeList[idx]] = idx;
    }

    return typeToIntMap;
  }
}
