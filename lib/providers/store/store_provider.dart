import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sup/models/map/today.dart';

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

  void getStoreList(double lat, double lng, int tagNo, int category,
      String keyword, String sort) async {
    try {
      state = await repository.getStoreList(
          lat, lng, tagNo, category, keyword, sort);
    } catch (e) {
      print(e);
    }
  }
}
