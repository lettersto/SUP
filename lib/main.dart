import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/ui/map_search/map_search_page.dart';
import 'package:sup/ui/review_form/review_form_page.dart';

import './ui/map/map_page.dart';
import './ui/review/review_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SUP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      initialRoute: '/reviews',
      routes: {
        '/': (context) => const MapPage(),
        '/reviews': (context) => const ReviewPage(),
        ReviewFormPage.routName: (context) => const ReviewFormPage(),
        '/map-search': (context) => const MapSearchPage(),
      },
    );
  }
}
