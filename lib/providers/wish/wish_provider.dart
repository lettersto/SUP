import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sup/models/wish/wish.dart';
import 'package:sup/ui/map/map_page.dart';
import '../../models/map/store.dart';
import '../../repositories/store/store_repository.dart';
import '../../repositories/wish/wish_repository.dart';
import '../store/map_controller_provider.dart';

final wishProvider = StateNotifierProvider<WishNotifier, WishResponse>((ref) {
  final repository = ref.watch(
    wishRepositoryProvider,
  );
  final GoogleMapController? controller = ref.watch(mapControllerProvider);

  return WishNotifier(repository: repository, controller: controller);
});

class WishNotifier extends StateNotifier<WishResponse> {
  final WishRepository repository;
  final GoogleMapController? controller;

  WishNotifier({required this.repository, required this.controller})
      : super(WishResponse(list: []));

  void getWishList(int userNo) async {
    try {
      state = await repository.getWishList(userNo);
    } catch (e) {
      print(e);
    }
  }

  void postWish(int userNo, int storeNo) async {
    try {
      await repository.postWish(PostWishRequest(userNo, storeNo));
      state = await repository.getWishList(userNo);
      print("${state.list.length} yyyyyyy");
    } catch (e) {
      print(e);
    }
  }

  void deleteWish(int userNo, int storeNo) async {
    try {
      await repository.deleteWish(userNo, storeNo);
      state = await repository.getWishList(userNo);
    } catch (e) {
      print(e);
    }
  }
}
