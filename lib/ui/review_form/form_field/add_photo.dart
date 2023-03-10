import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  // TODO implement image picker
  void _showImagePicker() {
    print('open image picker!!');
  }

  @override
  Widget build(BuildContext context) {
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
          onTap: _showImagePicker,
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
