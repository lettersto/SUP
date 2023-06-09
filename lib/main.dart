import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'ui/map/map_page.dart';
import 'ui/map_search/map_search_page.dart';
import 'ui/photo_detail/photo_detail_page.dart';
import 'ui/photos_detail/review_detail_multiple_photo_page.dart';
import 'ui/review/review_page.dart';
import 'ui/review_form/review_form_page.dart';
import 'ui/signup/signup_page.dart';
import 'utils/app_utils.dart';
import 'utils/sharedPreference_util.dart';
import 'utils/styles.dart';

const routeSignup = '/';
const routeMap = '/map';
const routeReview = '/reviews';
const routeReviewForm = '/review-form';
const photoDetail = '/multiple-photo-detail';
const photosDetail = '/photos-detail';
const routeSearch = '/map-search';
const routeSearchResult = '/map-result';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SharedPreferenceUtil().init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SUP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      home: SharedPreferenceUtil().nickname == ""
          ? const SignUpPage()
          : const MapPage(),
      navigatorKey: navigatorKey,
      onGenerateRoute: (settings) {
        late Widget page;

        if (settings.name == routeMap) {
          page = const MapPage();
        } else if (settings.name == routeReview) {
          page = const ReviewPage(0);
        } else if (settings.name == routeReviewForm) {
          page = const ReviewFormPage();
        } else if (settings.name == routeSearch) {
          page = const MapSearchPage();
        } else if (settings.name == photoDetail) {
          page = const PhotoDetailPage();
        } else if (settings.name == photosDetail) {
          page = const ReviewDetailMultiplePhotoPage(
            images: [],
          );
        } else if (settings.name == routeSignup) {
          page = const SignUpPage();
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
