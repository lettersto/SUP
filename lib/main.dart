import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/ui/map_search/map_search_page.dart';
import 'package:sup/ui/review_form/review_form_page.dart';

import './ui/map/map_page.dart';
import './ui/review/review_page.dart';

const routeMap = '/';
const routeReview = '/reviews';
const routeReviewForm = '/review-form';
const routeSearch = '/map-search';
const routeSearchResult = '/map-result';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
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
        fontFamily: 'NotoSans',
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        late Widget page;

        if (settings.name == routeMap) {
          page = const MapPage();
        } else if (settings.name == routeReview) {
          page = const ReviewPage();
        } else if (settings.name == routeReviewForm) {
          page = const ReviewFormPage();
        } else if (settings.name == routeSearch) {
          page = const MapSearchPage();
        } else {
          throw Exception('Unknown route: ${settings.name}');
        }

        return MaterialPageRoute(
            builder: (context) {
              return page;
            },
            settings: settings);
      },
    );
  }
}
