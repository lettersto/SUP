import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/data_utils.dart';

@freezed
class Today {
  final int storeNo;
  final String storeName;
  final String address;
  final int category;
  final int reviewCnt;
  final double starAvg;
  final List<String> imgs;
  bool like;

  Today(
      {required this.storeNo,
      required this.storeName,
      required this.address,
      required this.category,
      required this.reviewCnt,
      required this.starAvg,
      required this.imgs,
      required this.like});

  factory Today.fromJson(Map<String, dynamic> json) {
    return Today(
        storeNo: json['storeNo'],
        storeName: json['storeName'],
        address: json['address'],
        category: json['category'],
        reviewCnt: json['reviewCnt'],
        starAvg: json['starAvg'],
        imgs: json['imgs'],
        like: json['like']);
  }
}
