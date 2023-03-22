import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/wish/wish.dart';
import '../../repositories/wish/wish_repository.dart';

final wishProvider = StateNotifierProvider<WishNotifier, WishResponse>((ref) {
  final repository = ref.watch(
    wishRepositoryProvider,
  );

  return WishNotifier(repository: repository);
});

class WishNotifier extends StateNotifier<WishResponse> {
  final WishRepository repository;

  WishNotifier({required this.repository}) : super(WishResponse(list: []));

  Future<void> getWishList(int userNo) async {
    try {
      state = await repository.getWishList(userNo);
    } catch (e) {
      print(e);
    }
  }

  Future<void> postWish(int userNo, int storeNo) async {
    await repository.postWish(PostWishRequest(userNo, storeNo));
  }

  Future<void> deleteWish(int userNo, int storeNo) async {
    await repository.deleteWish(userNo, storeNo);
  }
}
