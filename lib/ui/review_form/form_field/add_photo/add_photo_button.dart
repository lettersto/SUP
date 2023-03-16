import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sup/utils/app_utils.dart';

import '../../../../providers/review/review_form_provider.dart';
import '../../../../utils/styles.dart';

class AddPhotoButton extends ConsumerWidget {
  final ImagePicker _picker = ImagePicker();
  final _imageCntLimit = 10;

  AddPhotoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> pickImg() async {
      List<XFile> images = await _picker.pickMultiImage(imageQuality: 50);

      if (images.length > _imageCntLimit) {
        images = images.sublist(0, _imageCntLimit);
        showToast('사진은 최대 $_imageCntLimit장까지만 가능합니다.');
      }

      if (images.isNotEmpty) {
        final List<File> filePaths =
            images.map((image) => File(image.path)).toList();
        ref.read(reviewFormProvider.notifier).setImgs(filePaths);
      }
    }

    return GestureDetector(
      onTap: pickImg,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.add_a_photo_rounded),
            const SizedBox(
              width: 8,
            ),
            const Text('사진 추가', style: TextStyles.medium20),
            const SizedBox(
              width: 8,
            ),
            Text(
              '최대 10장',
              style: TextStyles.medium18.merge(
                const TextStyle(
                  color: AppColors.gray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
