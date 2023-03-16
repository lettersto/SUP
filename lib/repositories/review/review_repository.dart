import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart';

import '../../models/common/cursor_pagination_model.dart';
import '../../models/common/pagination_params.dart';
import '../../models/review/review.dart';
import '../../providers/common/common_provider.dart';
import '../common/base_pagination_repository.dart';

part 'review_repository.g.dart';

@RestApi()
abstract class PaginatedReviewRepository
    implements IBasePaginationRepository<ReviewDetailWithPhotos> {
  factory PaginatedReviewRepository(Dio dio, {String baseUrl}) =
      _PaginatedReviewRepository;

  @override
  @GET('/')
  Future<CursorPagination<ReviewDetailWithPhotos>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}

final paginatedReviewRepositoryProvider =
    Provider.family<PaginatedReviewRepository, ReviewDetailParams>(
        (ref, ReviewDetailParams params) {
  final dio = ref.watch(dioProvider);
  final repository = PaginatedReviewRepository(dio,
      baseUrl:
          '${dotenv.env['baseUrl']}/review/${params.storeNo}/${params.userNo}');
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
}
