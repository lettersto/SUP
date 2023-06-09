import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart';

import '../../models/review/image_review.dart';
import '../../models/review/like_param.dart';
import '../../models/common/cursor_pagination_model.dart';
import '../../models/common/pagination_params.dart';
import '../../models/review/review.dart';
import '../../models/review/tag_chart.dart';
import '../../providers/common/common_provider.dart';
import '../common/base_pagination_repository.dart';

part 'review_repository.g.dart';

@RestApi()
abstract class PaginatedReviewRepository
    implements IBasePaginationRepository<ReviewDetailWithPhotos> {
  factory PaginatedReviewRepository(Dio dio, {String baseUrl}) =
      _PaginatedReviewRepository;

  @override
  @GET('/review/{storeNo}/{userNo}')
  Future<CursorPagination<ReviewDetailWithPhotos>> paginate({
    @Queries() PaginationQueryParams? paginationQueryParams =
        const PaginationQueryParams(),
    @Path('storeNo') required int storeNo,
    @Path('userNo') int? userNo,
  });
}

@RestApi()
abstract class PaginatedImageReviewRepository
    implements IBasePaginationRepository<ImageReviewItemModel> {
  factory PaginatedImageReviewRepository(Dio dio, {String baseUrl}) =
      _PaginatedImageReviewRepository;

  @override
  @GET('/review/img/{storeNo}')
  Future<CursorPagination<ImageReviewItemModel>> paginate({
    @Queries() PaginationQueryParams? paginationQueryParams =
        const PaginationQueryParams(),
    @Path('storeNo') required int storeNo,
    @Path('userNo') int? userNo,
  });
}

final paginatedReviewRepositoryProvider =
    Provider<PaginatedReviewRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final repository = PaginatedReviewRepository(dio);
  return repository;
});

final paginatedImageReviewRepositoryProvider =
    Provider<PaginatedImageReviewRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final repository = PaginatedImageReviewRepository(dio);
  return repository;
});

@RestApi()
abstract class ReviewClient {
  factory ReviewClient(Dio dio, {String baseUrl}) = _ReviewClient;

  @POST('/review')
  @MultiPart()
  Future<void> createReview({
    @Part(name: 'storeNo', contentType: 'multipart/form-data')
        required int storeNo,
    @Part(name: 'userNo', contentType: 'multipart/form-data')
        required int userNo,
    @Part(name: 'content', contentType: 'multipart/form-data')
        required String content,
    @Part(name: 'star', contentType: 'multipart/form-data') required int star,
    @Part(name: 'tags', contentType: 'multipart/form-data')
        required List<String> tags,
    @Part(name: 'imgs', contentType: 'multipart/form-data') List<File>? imgs,
  });

  @GET('/review/{reviewImgNo}')
  Future<ReviewDetail> getReviewDetail({
    @Path('reviewImgNo') required int reviewImgNo,
  });

  @GET('/review/tags/{storeNo}')
  Future<TagChartModel> getTagChart({
    @Path('storeNo') required int storeNo,
  });

  @GET('/review/count/{storeNo}')
  Future<int> getTotalReviewCount({
    @Path('storeNo') required int storeNo,
  });

  @POST('/review/like')
  Future<void> markLike(@Body() LikeParam likeParam);

  @DELETE('/review/like/{reviewLikeNo}/{userNo}')
  Future<void> removeLike({
    @Path('reviewLikeNo') required int reviewNo,
    @Path('userNo') required int userNo,
  });
}
