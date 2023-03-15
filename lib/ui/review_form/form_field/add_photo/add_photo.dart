import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/review/review_form_provider.dart';
import '../../../../utils/styles.dart';

import './add_photo_button.dart';
import './selected_photos.dart';

class AddPhoto extends ConsumerWidget {
  const AddPhoto({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Text(
          '리뷰를 남겨주세요',
          style: TextStyles.bold24,
        ),
        const SizedBox(
          height: 32.0,
        ),
        if (ref.watch(reviewFormProvider).imgs.isEmpty)
          AddPhotoButton()
        else
          SelectedPhotos(),
      ],
    );
  }
}
