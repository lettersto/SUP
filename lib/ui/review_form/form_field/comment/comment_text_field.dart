import 'package:flutter/material.dart';

import '../../../../utils/styles.dart';

class CommentTextField extends StatelessWidget {
  final TextEditingController controller;

  const CommentTextField({
    super.key,
    required this.controller,
  });

  static const _hintText =
      '리뷰 작성하기\n업주와 다른 사용자들이 상처받지 않도록\n좋은 표현을 사용해주세요. 유용한 Tip도 남겨주세요!';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.pink40,
        maxLines: 5,
        maxLength: 400,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return '리뷰는 0자 이상 400자 이하여야 합니다.';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: _hintText,
          filled: true,
          fillColor: AppColors.pink10,
          contentPadding: const EdgeInsets.all(16.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
