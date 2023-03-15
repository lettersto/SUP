import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:sup/models/signup/signup_response.dart';
import 'package:sup/repositories/common/base_repository.dart';

import '../../providers/common/common_provider.dart';

part 'user_repository.g.dart';

@RestApi()
abstract class UserRepository implements IUserRepository {
  factory UserRepository(Dio dio) = _UserRepository;

  @override
  @POST('/user')
  Future<User> signup(@Body() UserRequest userRequest);
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return UserRepository(dio);
});
