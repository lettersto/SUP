import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class TagChartBar extends StatelessWidget {
  final Map<String, dynamic> tag;

  const TagChartBar({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          decoration: BoxDecoration(
            color: AppColors.pink15,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        FractionallySizedBox(
          widthFactor: tag['percent'],
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            margin: const EdgeInsets.symmetric(vertical: 2.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(250, 173, 202, tag['percent']),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          margin: const EdgeInsets.symmetric(vertical: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tag['title'],
                style: TextStyles.bold16,
              ),
              Text(
                '250',
                style: TextStyles.medium16.merge(
                  const TextStyle(color: AppColors.pink30),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
