import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sup/models/signup/signup_response.dart';
import 'package:sup/repositories/base_repository.dart';

part 'signup_repository.g.dart';

abstract class UserRepository extends BaseRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @POST('/user')
  Future<User> postUser(@Body() UserRequest userRequest);
}
