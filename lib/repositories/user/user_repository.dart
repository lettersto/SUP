import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/http.dart';
import 'package:sup/models/signup/signup_response.dart';
import 'package:sup/repositories/common/base_repository.dart';

part 'user_repository.g.dart';

abstract class UserRepository implements IUserRepository {
  factory UserRepository(Dio dio) = _UserRepository;

  @override
  @POST('/user')
  Future<User> signup(@Body() UserRequest userRequest);
}
