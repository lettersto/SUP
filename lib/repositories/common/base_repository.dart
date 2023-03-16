import 'package:sup/models/map/store.dart';
import '../../models/map/today.dart';
import '../../models/signup/signup.dart';

abstract class IUserRepository {
  Future<User> signup(UserRequest userRequest);
}

abstract class IStoreRepository {
  Future<TodayResponse> getTodayList(int userNo, double lat, double lng);

  Future<StoreResponse> getStoreList(double lat, double lng, int tagNo,
      int category, String keyword, String sort);

  Future<StoreDetail> getStoreDetail(int storeNo, int userNo);
}
