import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/main.dart';
import 'package:sup/models/signup/signup_response.dart';
import 'package:sup/repositories/user/user_repository.dart';
import 'package:sup/utils/app_utils.dart';
import 'package:sup/utils/sharedPreference_util.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  final repository = ref.watch(
    userRepositoryProvider,
  );

  return UserNotifier(repository: repository);
});

class UserNotifier extends StateNotifier<User> {
  final UserRepository repository;

  UserNotifier({required this.repository}) : super(User.init());

  void signup(UserRequest userRequest) async {
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
