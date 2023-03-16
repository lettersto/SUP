import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:sup/models/wish/wish.dart';
import 'package:sup/providers/common/common_provider.dart';
import '../common/base_repository.dart';

part 'wish_repository.g.dart';

@RestApi()
abstract class WishRepository implements IWishRepository {
  factory WishRepository(Dio dio) = _WishRepository;

  @override
  @GET('/wish/{userNo}')
  Future<WishResponse> getWishList(@Path('userNo') int userNo);

  @override
  @POST('/wish')
  Future<PostWishResponse> postWish(@Body() PostWishRequest);

  @override
  @DELETE('/wish/{userNo}/{storeNo}')
  Future<void> deleteWish(
      @Path('userNo') int userNo, @Path('storeNo') int storeNo);
}

final wishRepositoryProvider = Provider<WishRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return WishRepository(dio);
});
