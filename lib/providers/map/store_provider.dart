import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/models/map/today.dart';
import 'package:sup/repositories/map/store_repository.dart';

final storeProvider =
    StateNotifierProvider<StoreNotifier, TodayResponse>((ref) {
  final repository = ref.watch(
    storeRepositoryProvider,
  );

  return StoreNotifier(repository: repository);
});

class StoreNotifier extends StateNotifier<TodayResponse> {
  final StoreRepository repository;

  StoreNotifier({required this.repository}) : super(TodayResponse(list: []));

  void getTodayList(int userNo, double lat, double lng) async {
    try {
      state = await repository.getTodayList(userNo, lat, lng);
      //print(state[0].storeName);
    } catch (e) {
      print(e);
    }
  }
}
