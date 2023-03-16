import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/models/map/today.dart';

import '../../repositories/store/store_repository.dart';

final todayProvider =
    StateNotifierProvider<TodayNotifier, TodayResponse>((ref) {
  final repository = ref.watch(
    storeRepositoryProvider,
  );

  return TodayNotifier(repository: repository);
});

class TodayNotifier extends StateNotifier<TodayResponse> {
  final StoreRepository repository;

  TodayNotifier({required this.repository}) : super(TodayResponse(list: []));

  void getTodayList(int userNo, double lat, double lng) async {
    try {
      state = await repository.getTodayList(userNo, lat, lng);
    } catch (e) {
      print(e);
    }
  }
}
