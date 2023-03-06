import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sup/utils/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final newStyle = const TextStyle(color: AppColors.pinkAccent).merge(TextStyles.appBarTitle);
    return MaterialApp(
      title: 'SUP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(child: Text("data", style: const TextStyle(color: AppColors.pinkAccent).merge(TextStyles.bold20)),),
      ),
    );
  }
}
