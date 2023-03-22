import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

import '../../models/map/store.dart';
import '../../models/map/today_pick.dart';
import '../../providers/common/common_provider.dart';
import '../common/base_repository.dart';

part 'store_repository.g.dart';

@RestApi()
abstract class StoreRepository implements IStoreRepository {
  factory StoreRepository(Dio dio) = _StoreRepository;

  @override
  @GET('/store/today/{userNo}')
  Future<TodayResponse> getTodayList(@Path('userNo') int userNo,
      @Query('lat') double lat, @Query('lng') double lng);

  @override
  @GET('/store')
  Future<StoreResponse> getStoreList(
      @Query('lat') double lat,
      @Query('lng') double lng,
      @Query('tagNo') int tagNo,
      @Query('category') int category,
      @Query('keyword') String keyword,
      @Query('sort') String sort);

  @override
  @GET('/store/{storeNo}/{userNo}')
  Future<StoreDetail> getStoreDetail(
      @Path('storeNo') int storeNo, @Path('userNo') int userNo);
}

final storeRepositoryProvider = Provider<StoreRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return StoreRepository(dio);
});
