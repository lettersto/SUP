import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/map/tag_map.dart';
import '../../utils/sharedPreference_util.dart';
import '../common/tag_filter_item.dart';
import '../map_result/map_search_result.dart';
import '../map_search/map_search_page.dart';

class TagMapList extends ConsumerStatefulWidget {
  const TagMapList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => TagMapListState();
}

class TagMapListState extends ConsumerState<TagMapList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cates.length,
        itemBuilder: (BuildContext context, int position) {
          MapTag cate = cates[position];
          return Container(
            margin: position == 0
                ? const EdgeInsets.only(top: 4, left: 9)
                : const EdgeInsets.only(top: 4),
            child: GestureDetector(
                onTap: () {
                  updateRecents(cate.tagName);

                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, a1, a2) =>
                            const MapSearchPage()),
                  );
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, a1, a2) =>
                          MapResultPage(cate.tagName, cate.code),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                child: TagFilterItem(
                    tag: cate.getEmojiTagName(),
                    shadow: true,
                    background: Colors.white)),
          );
        },
      ),
    );
  }
}
