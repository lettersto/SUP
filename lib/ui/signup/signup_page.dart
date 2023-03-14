import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sup/ui/map/map_page.dart';
import 'package:sup/utils/sharedPreference_util.dart';
import 'package:sup/utils/styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  String? user;

  @override
  void initState() {
    super.initState();
    getUserName();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: user == null
            ? Center(
                child: TextField(
                  maxLines: 1,
                  autofocus: true,
                  onSubmitted: (text) {
                    updateUserName(text);
                    getUserName();
                    setState(() {});
                  },
                ),
              )
            : Center(child: Text(user!)));
  }

  void getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    user = prefs.getString('nickname');
  }

  void updateUserName(String user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('nickname', user);
  }
}
