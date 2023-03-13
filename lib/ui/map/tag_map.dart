import 'package:flutter/material.dart';
import 'package:sup/ui/common/tag_filter_item_selected.dart';

import '../../models/tag_map.dart';
import '../../utils/styles.dart';
import '../common/tag_filter_item.dart';

class TagMapList extends StatefulWidget {
  const TagMapList({super.key});

  @override
  State<StatefulWidget> createState() => TagMapListState();
}

class TagMapListState extends State<TagMapList> {
  @override
  Widget build(BuildContext context) {
    int selectedIdx = -1;

    return SizedBox(
      height: 54,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cates.length,
        itemBuilder: (BuildContext context, int position) {
          return Container(
            margin: position == 0
                ? const EdgeInsets.only(top: 4, left: 9)
                : const EdgeInsets.only(top: 4),
            child: GestureDetector(
                onTap: () {},
                child: TagFilterItem(
                  tag: cates[position].tagName,
                  shadow: true,
                  background: Colors.white,
                )),
          );
        },
      ),
    );
  }
}
