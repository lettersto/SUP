import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/store/store_detail_provider.dart';
import '../../utils/styles.dart';
import './review_form_appbar.dart';
import './review_form.dart';

class ReviewFormPage extends ConsumerWidget {
  const ReviewFormPage({Key? key}) : super(key: key);

  static const String routName = '/review-form';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeName = ref.watch(storeDetailProvider).storeName ?? '';

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ReviewFormAppBar(
              storeName: storeName,
            ),
            const ReviewForm(),
          ],
        ),
      ),
    );
  }
}
