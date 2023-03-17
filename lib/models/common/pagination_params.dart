import 'package:json_annotation/json_annotation.dart';

part 'pagination_params.g.dart';

@JsonSerializable()
class PaginationQueryParams {
  final int? lastNo;
  final int? size;

  final int? tagNo;
  final String? keyword;
  final String? sort;
  final bool? imgOnly;

  const PaginationQueryParams({
    this.lastNo,
    this.size,
    this.tagNo,
    this.keyword,
    this.sort,
    this.imgOnly,
  });

  PaginationQueryParams copyWith({
    int? lastNo,
    int? size,
    int? tagNo,
    String? keyword,
    String? sort,
    bool? imgOnly,
  }) {
    return PaginationQueryParams(
      lastNo: lastNo ?? this.lastNo,
      size: size ?? this.size,
      tagNo: tagNo ?? this.tagNo,
      keyword: keyword ?? this.keyword,
      sort: sort ?? this.sort,
      imgOnly: imgOnly ?? this.imgOnly,
    );
  }

  factory PaginationQueryParams.fromJson(Map<String, dynamic> json) =>
      _$PaginationQueryParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationQueryParamsToJson(this);
}

@JsonSerializable()
class PaginationPathParams {
  final int? storeNo;
  final int? userNo;

  const PaginationPathParams({
    this.storeNo,
    this.userNo,
  });

  factory PaginationPathParams.fromJson(Map<String, dynamic> json) =>
      _$PaginationPathParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationPathParamsToJson(this);
}

@JsonSerializable()
class Params {
  final PaginationPathParams paginationPathParams;
  final PaginationQueryParams paginationQueryParams;

  const Params({
    required this.paginationPathParams,
    required this.paginationQueryParams,
  });

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsToJson(this);
}
