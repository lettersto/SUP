import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:sup/providers/common/common_provider.dart';
import '../../models/map/today.dart';
import '../common/base_repository.dart';

part 'store_repository.g.dart';

@RestApi()
abstract class StoreRepository implements IStoreRepository {
  factory StoreRepository(Dio dio) = _StoreRepository;

  @override
  @GET('/store/today/{userNo}')
  Future<TodayResponse> getTodayList(@Path('userNo') int userNo,
      @Query('lat') double lat, @Query('lng') double lng);
}

final storeRepositoryProvider = Provider<StoreRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return StoreRepository(dio);
});
