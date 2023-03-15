import '../../models/signup/signup_response.dart';

abstract class IUserRepository {
  Future<User> signup(UserRequest userRequest);
}
