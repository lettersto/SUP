import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/dummy_providers.dart';
import '../../../../utils/styles.dart';

class StarRating extends ConsumerStatefulWidget {
  const StarRating({super.key});

  @override
  ConsumerState<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends ConsumerState<StarRating> {
  final _selection = List.generate(5, (_) => false);

  @override
  Widget build(BuildContext context) {
    var selectedStarIdx = ref.watch(reviewFormFieldProvider).star;

    void pressHandler(int newStarIdx) {
      setState(() {
        _selection.fillRange(0, 5, false);
        _selection.fillRange(0, newStarIdx + 1, true);
      });
      ref.read(reviewFormFieldProvider.notifier).setStarRate(newStarIdx + 1);
    }

    return ToggleButtons(
      isSelected: _selection,
      onPressed: pressHandler,
      renderBorder: false,
      color: AppColors.grayTransparent30,
      fillColor: const Color.fromRGBO(0, 0, 0, 0),
      highlightColor: const Color.fromRGBO(0, 0, 0, 0),
      selectedColor: AppColors.pink40,
      splashColor: const Color.fromRGBO(0, 0, 0, 0),
      children: List.generate(
        5,
        (_) => const Icon(Icons.star_rounded, size: 48),
      ),
    );
  }
}
