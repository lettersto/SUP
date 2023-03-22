import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/signup/signup.dart';
import '../../providers/user/user_provider.dart';
import '../../utils/styles.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/app.png'),
          height: 60,
          fit: BoxFit.fill,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: AppColors.pink40, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: AppColors.pink40, width: 2.0)),
                hintText: "닉네임을 입력하세요!",
                hintStyle: TextStyles.regular16
                    .merge(const TextStyle(color: AppColors.blackTransparent))),
            maxLines: 1,
            autofocus: true,
            onSubmitted: (text) async {
              ref
                  .read(userProvider.notifier)
                  .signup(UserRequest(nickname: text));
            },
          ),
        ),
      ],
    )));
  }
}
