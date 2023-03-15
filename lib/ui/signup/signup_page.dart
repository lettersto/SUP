import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/models/signup/signup_response.dart';
import 'package:sup/providers/user/user_provider.dart';
import 'package:sup/utils/styles.dart';

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
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(width: 3, color: AppColors.pinkAccent),
                ),
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
