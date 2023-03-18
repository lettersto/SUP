import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/models/wish/wish.dart';
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
    try {
      await repository.postWish(PostWishRequest(userNo, storeNo));
      state = await repository.getWishList(userNo);
      print("${state.list.length} yyyyyyy");
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteWish(int userNo, int storeNo) async {
    try {
      await repository.deleteWish(userNo, storeNo);
      state = await repository.getWishList(userNo);
    } catch (e) {
      print(e);
    }
  }
}
