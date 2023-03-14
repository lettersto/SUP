import 'package:flutter/material.dart';
import 'package:sup/models/dummy/dummy_review.dart';

import '../../../utils/enums.dart';
import '../../../utils/styles.dart';

class ReviewText extends StatefulWidget {
  final String text;
  final String newText;
  final bool isCollapsible;
  final ReviewMode mode;

  const ReviewText({
    super.key,
    required this.text,
    this.newText = '',
    this.isCollapsible = false,
    this.mode = ReviewMode.main,
  });

  factory ReviewText.forMain(String text) {
    var replacedText = text.replaceAll(RegExp(r'(\n)+?'), ' ');
    return ReviewText(
      text: text,
      newText:
          '${replacedText.length >= 90 ? replacedText.substring(0, 90) : replacedText}...',
      isCollapsible: replacedText.length >= 90,
      mode: ReviewMode.main,
    );
  }

  factory ReviewText.forDetail(String text) {
    var replacedText = text.replaceAll(RegExp(r'(\n)+?'), ' ');
    return ReviewText(
      text: replacedText,
      newText: replacedText,
      isCollapsible: false,
      mode: ReviewMode.detail,
    );
  }

  @override
  State<ReviewText> createState() => _ReviewTextState();
}

class _ReviewTextState extends State<ReviewText> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    final textColor =
        widget.mode == ReviewMode.detail ? AppColors.white : AppColors.black;

    return InkWell(
      onTap: () {
        if (_isOpen) return;
        setState(() {
          _isOpen = true;
        });
      },
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          widget.isCollapsible && !_isOpen ? widget.newText : widget.text,
          style: TextStyles.medium16.merge(TextStyle(
            height: 1.5,
            color: textColor,
          )),
        ),
      ),
    );
  }
}
