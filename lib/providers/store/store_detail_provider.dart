import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/map/store.dart';
import '../../repositories/store/store_repository.dart';

final storeDetailProvider =
    StateNotifierProvider<StoreDetailNotifier, StoreDetail>((ref) {
  final repository = ref.watch(
    storeRepositoryProvider,
  );

  return StoreDetailNotifier(repository: repository);
});

class StoreDetailNotifier extends StateNotifier<StoreDetail> {
  final StoreRepository repository;

  StoreDetailNotifier({required this.repository}) : super(StoreDetail.init());

  Future<void> getStoreDetail(int storeNo, int userNo) async {
    try {
      if (state.storeNo != storeNo) {
        state = await repository.getStoreDetail(storeNo, userNo);
      }
    } catch (e) {
      print(e);
    }
  }
}
