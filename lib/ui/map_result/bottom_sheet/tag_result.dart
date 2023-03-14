import 'package:flutter/material.dart';
import 'package:sup/ui/common/tag_filter_item_selected.dart';

import '../../../models/tag_map.dart';
import '../../../utils/styles.dart';
import '../../common/tag_filter_item.dart';

class TagResultList extends StatefulWidget {
  const TagResultList({super.key});

  @override
  State<StatefulWidget> createState() => TagResultListState();
}

class TagResultListState extends State<TagResultList> {
  int selectedIdx = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (BuildContext context, int position) {
            MapTag tag = tags[position];
            return Container(
                margin: position == 0
                    ? const EdgeInsets.only(left: 16, top: 4, right: 6)
                    : const EdgeInsets.only(top: 4, right: 6),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIdx = position;
                      });
                    },
                    child: (selectedIdx == position)
                        ? TagFilterItemSelected(
                            tag: tag.getEmojiTagName(),
                            shadow: false,
                            background: AppColors.pink15,
                          )
                        : TagFilterItem(
                            tag: tag.getEmojiTagName(),
                            shadow: false,
                            background: AppColors.pink15)));
          },
        ));
  }
}