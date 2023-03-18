import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers_exporter.dart';
import '../../../models/review/review_tag.dart';
import '../../../utils/styles.dart';

class TagFilterButton extends ConsumerStatefulWidget {
  const TagFilterButton({Key? key}) : super(key: key);

  @override
  ConsumerState<TagFilterButton> createState() => _TagFilterButtonState();
}

class _TagFilterButtonState extends ConsumerState<TagFilterButton> {
  @override
  Widget build(BuildContext context) {
    const tags = tagData;
    final selectedState = ref.watch(reviewTagFilterProvider).selectedState;
    var transparent = const Color.fromRGBO(0, 0, 0, 0);

    void pressHandler(int selectedIndex) {
      ref.read(reviewTagFilterProvider.notifier).selectFilter(selectedIndex);
    }

    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        ToggleButtons(
          isSelected: selectedState,
          renderBorder: false,
          color: AppColors.gray,
          fillColor: transparent,
          highlightColor: transparent,
          focusColor: transparent,
          splashColor: transparent,
          selectedColor: AppColors.pink40,
          onPressed: pressHandler,
          children: tags
              .map((tag) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: ((ref.watch(reviewTagFilterProvider).selected !=
                                  -1) &&
                              (ref.watch(reviewTagFilterProvider).selected +
                                      3 ==
                                  tag['tagNo'] as int))
                          ? AppColors.pink30
                          : AppColors.grayTransparent2,
                    ),
                  ),
                  height: 30,
                  margin: const EdgeInsets.only(right: 4.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  alignment: Alignment.center,
                  child: Text(tag['value_abbrv'] as String)))
              .toList(),
        ),
      ],
    );
  }
}
