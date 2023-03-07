import 'package:flutter/material.dart';
import 'package:sup/ui/map_search/map_search_page.dart';
import 'package:sup/ui/review_form/review_form_page.dart';

import './ui/map/map_page.dart';
import './ui/review/review_page.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const MapPage(),
        '/reviews': (context) => const ReviewPage(),
        '/review-form': (context) => const ReviewFormPage(),
        '/map-search': (context) => const MapSearchPage(),
      },
    );
  }
}
