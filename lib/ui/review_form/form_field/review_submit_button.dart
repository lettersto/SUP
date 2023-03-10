import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class ReviewSubmitButton extends StatelessWidget {
  const ReviewSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.pink40,
      ),
      onPressed: () {
        // if (_formKey.currentState!.validate()) {
        //
        // }
      },
      child: Text(
        '등록하기',
        style: TextStyles.bold14.merge(
          const TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
