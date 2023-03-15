import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../providers/review/review_form_provider.dart';
import '../../../../utils/styles.dart';
import '../../../../utils/app_utils.dart';

class SelectedPhotos extends ConsumerWidget {
  final ImagePicker _picker = ImagePicker();
  final _imageCntLimit = 10;

  SelectedPhotos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width * 0.2;
    final images = ref.watch(reviewFormProvider).imgs;
    final thumbnails =
        images.sublist(0, images.length >= 4 ? 4 : images.length);

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

    Widget photoContainer({Widget? child, Color? color}) {
      return GestureDetector(
        onTap: pickImg,
        child: Container(
          width: width,
          height: width,
          color: color,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: FittedBox(
              fit: BoxFit.fill,
              child: child,
            ),
          ),
        ),
      );
    }

    return Wrap(
      spacing: 4,
      children: [
        if (thumbnails.length > 1)
          ...thumbnails
              .sublist(0, thumbnails.length - 1)
              .map((image) => photoContainer(
                      child: Image.file(
                    image,
                    fit: BoxFit.cover,
                  )))
              .toList(),
        Stack(
          children: [
            photoContainer(
              child: Image.file(
                thumbnails.last,
                fit: BoxFit.cover,
              ),
            ),
            photoContainer(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  photoContainer(
                    color: const Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                  Text(
                    '+ ${images.length > 4 ? (images.length - 4).toString() : ''}',
                    style: TextStyles.bold20
                        .merge(const TextStyle(color: AppColors.white)),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
