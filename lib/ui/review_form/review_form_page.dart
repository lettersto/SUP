import 'package:flutter/material.dart';

import '../../utils/styles.dart';
import './review_form_appbar.dart';
import './review_form.dart';

class ReviewFormPage extends StatelessWidget {
  const ReviewFormPage({Key? key}) : super(key: key);

  static const String routName = '/review-form';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ReviewFormAppBar(
              storeName: '폴바셋',
            ),
            ReviewForm(),
          ],
        ),
      ),
    );
  }
}
