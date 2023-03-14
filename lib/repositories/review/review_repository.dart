import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common/cursor_pagination_model.dart';
import '../../models/common/pagination_params.dart';
import '../../models/review/review.dart';
import '../../providers/common/common_provider.dart';
import '../common/base_pagination_repository.dart';

part 'review_repository.g.dart';

@RestApi()
abstract class ReviewRepository
    implements IBasePaginationRepository<ReviewDetailWithPhotos> {
  factory ReviewRepository(Dio dio, {String baseUrl}) = _ReviewRepository;

  @override
  @GET('/')
  Future<CursorPagination<ReviewDetailWithPhotos>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}

final reviewRepositoryProvider =
    Provider.family<ReviewRepository, ReviewDetailParams>(
        (ref, ReviewDetailParams params) {
  final dio = ref.watch(dioProvider);
  final repository = ReviewRepository(dio,
      baseUrl:
          'http://ec2-54-180-46-145.ap-northeast-2.compute.amazonaws.com:8080/api/review/${params.storeNo}/${params.userNo}');
  return repository;
});
