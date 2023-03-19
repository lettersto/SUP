import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

import '../../models/signup/signup.dart';
import '../../providers/common/common_provider.dart';
import '../common/base_repository.dart';

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
