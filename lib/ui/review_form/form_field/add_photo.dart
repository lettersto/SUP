import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  final ImagePicker _picker = ImagePicker();
  final _imageCntLimit = 10;
  List<XFile> _pickedImgs = [];

  @override
  Widget build(BuildContext context) {
    Future<void> pickImg() async {
      List<XFile> images = await _picker.pickMultiImage();

      if (images.length > _imageCntLimit) {
        images = images.sublist(0, _imageCntLimit);
      }

      setState(() {
        _pickedImgs = images;
      });
    }

    return Column(
      children: [
        const Text(
          '리뷰를 남겨주세요',
          style: TextStyles.bold24,
        ),
        const SizedBox(
          height: 32.0,
        ),
        GestureDetector(
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
        ),
      ],
    );
  }
}
