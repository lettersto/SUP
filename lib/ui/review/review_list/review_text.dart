import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class ReviewText extends StatefulWidget {
  final String text;
  final String newText;
  final bool isCollapsible;

  const ReviewText({
    super.key,
    required this.text,
    this.newText = '',
    this.isCollapsible = false,
  });

  factory ReviewText.fromString(String text) {
    var replacedText = text.replaceAll(RegExp(r'(\n)+?'), ' ');
    return ReviewText(
      text: text,
      newText: '${replacedText.substring(0, 90)}...',
      isCollapsible: replacedText.length >= 90,
    );
  }

  @override
  State<ReviewText> createState() => _ReviewTextState();
}

class _ReviewTextState extends State<ReviewText> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isOpen) return;
        setState(() {
          isOpen = true;
        });
      },
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          widget.isCollapsible && !isOpen ? widget.newText : widget.text,
          style: TextStyles.medium16.merge(const TextStyle(height: 1.5)),
        ),
      ),
    );
  }
}
