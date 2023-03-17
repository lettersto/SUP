import 'package:sup/models/map/store.dart';
import '../../models/map/today_pick.dart';
import '../../models/signup/signup.dart';
import '../../models/wish/wish.dart';

abstract class IUserRepository {
  Future<User> signup(UserRequest userRequest);
}

abstract class IStoreRepository {
  Future<TodayResponse> getTodayList(int userNo, double lat, double lng);

  Future<StoreResponse> getStoreList(double lat, double lng, int tagNo,
      int category, String keyword, String sort);

  Future<StoreDetail> getStoreDetail(int storeNo, int userNo);
}

abstract class IWishRepository {
  Future<WishResponse> getWishList(int userNo);

  Future<PostWishResponse> postWish(PostWishRequest postWishRequest);

  Future<void> deleteWish(int userNo, int storeNo);
}
