import '../../models/map/today.dart';
import '../../models/signup/signup.dart';

abstract class IUserRepository {
  Future<User> signup(UserRequest userRequest);
}

abstract class IStoreRepository {
  Future<TodayResponse> getTodayList(int userNo, double lat, double lng);
}
