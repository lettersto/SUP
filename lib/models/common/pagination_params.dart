import 'package:json_annotation/json_annotation.dart';

part 'pagination_params.g.dart';

@JsonSerializable()
class PaginationParams {
  final int? lastNo;
  final int? size;

  final int? tagNo;
  final String? keyword;
  final String? sort;
  final bool? imgOnly;

  const PaginationParams({
    this.lastNo,
    this.size,
    this.tagNo,
    this.keyword,
    this.sort,
    this.imgOnly,
  });

  PaginationParams copyWith({
    int? lastNo,
    int? size,
    int? tagNo,
    String? keyword,
    String? sort,
    bool? imgOnly,
  }) {
    return PaginationParams(
      lastNo: lastNo ?? this.lastNo,
      size: size ?? this.size,
      tagNo: tagNo ?? this.tagNo,
      keyword: keyword ?? this.keyword,
      sort: sort ?? this.sort,
      imgOnly: imgOnly ?? this.imgOnly,
    );
  }

  factory PaginationParams.fromJson(Map<String, dynamic> json) =>
      _$PaginationParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationParamsToJson(this);
}

@JsonSerializable()
class ReviewDetailParams {
  final int storeNo;
  final int userNo;

  ReviewDetailParams({
    required this.storeNo,
    required this.userNo,
  });

  factory ReviewDetailParams.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDetailParamsToJson(this);
}
