import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/map/store.dart';
import '../../repositories/store/store_repository.dart';

final storeProvider =
    StateNotifierProvider<StoreNotifier, StoreResponse>((ref) {
  final repository = ref.watch(
    storeRepositoryProvider,
  );

  return StoreNotifier(repository: repository);
});

class StoreNotifier extends StateNotifier<StoreResponse> {
  final StoreRepository repository;

  StoreNotifier({required this.repository}) : super(StoreResponse(list: []));

  Future<void> getStoreList(double lat, double lng, int tagNo, int category,
      String keyword, String sort) async {
    try {
      if (!(tagNo == 0 && category == 0 && keyword == "")) {
        state = await repository.getStoreList(
            lat, lng, tagNo, category, keyword, sort);
      }
    } catch (e) {
      state = StoreResponse(list: []);
    }
  }
}
