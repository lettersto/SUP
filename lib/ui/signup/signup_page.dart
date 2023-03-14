import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sup/ui/map/map_page.dart';
import 'package:sup/utils/sharedPreference_util.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getUserName() == null
            ? Center(
                child: TextField(
                  maxLines: 1,
                  autofocus: true,
                  onSubmitted: (text) {
                    setState(() {
                      SharedPreferences.getInstance()
                          .then((sp) => sp.setString('nickname', text));
                    });
                  },
                ),
              )
            : MapPage());
  }
}
