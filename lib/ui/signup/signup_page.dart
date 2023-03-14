import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sup/main.dart';
import 'package:sup/repositories/signup_repository.dart';
import 'package:sup/utils/sharedPreference_util.dart';
import 'package:sup/utils/styles.dart';

import '../../models/signup/signup_response.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  late UserRepository client;

  @override
  void initState() {
    Dio dio = Dio();
    client = UserRepository(dio);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(16),
          child: TextField(
            maxLines: 1,
            autofocus: true,
            onSubmitted: (text) {
              updateUserName(text);
              Navigator.pushReplacementNamed(context, routeMap);
            },
            decoration: InputDecoration(
                hintText: "닉네임을 입력하세요!",
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: AppColors.pinkAccent)),
                hintStyle: TextStyles.regular16
                    .merge(const TextStyle(color: Colors.black))),
          )),
    );
  }

  void updateUserName(String nickname) async {
    User? user = await client.postUser(UserRequest(nickname: nickname));

    SharedPreferenceUtil().nickname = user.nickname;
    SharedPreferenceUtil().userNo = user.userNo;
  }
}
