import 'package:sup/models/signup/signup_response.dart';
import 'package:sup/repositories/user/user_repository.dart';
import 'package:sup/utils/dio_client.dart';

class UserController {
  UserRepository _userRepo = UserRepository(DioClient().getDio()!);

  Future<User> signup(UserRequest userRequest) {
    return _userRepo.signup(userRequest);
  }
}
