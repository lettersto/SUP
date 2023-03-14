import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sup/models/signup/signup_response.dart';

part 'signup_service.g.dart';

@RestApi()
abstract class SignupService {
  factory SignupService(Dio dio, {String baseUrl}) = _SignupService;

  @POST("/user")
  Future<User> signup(@Body() UserRequest userRequest);
}
