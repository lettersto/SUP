import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../../models/signup/signup.dart';
import '../../repositories/user/user_repository.dart';
import '../../utils/app_utils.dart';
import '../../utils/sharedPreference_util.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  final repository = ref.watch(
    userRepositoryProvider,
  );

  return UserNotifier(repository: repository);
});

class UserNotifier extends StateNotifier<User> {
  final UserRepository repository;

  UserNotifier({required this.repository}) : super(User.init());

  Future<void> signup(UserRequest userRequest) async {
    try {
      state = await repository.signup(userRequest);

      SharedPreferenceUtil().nickname = state.nickname;
      SharedPreferenceUtil().userNo = state.userNo;

      navigatorKey.currentState!.pushReplacementNamed(routeMap);
    } catch (e) {
      showToast("이미 사용중인 닉네임 입니다.");
    }
  }
}
