import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/providers/store/store_provider.dart';
import 'package:sup/ui/map_search/map_search_page.dart';
import 'package:sup/utils/sharedPreference_util.dart';

import '../../models/map/map.dart';
import '../../models/tag_map.dart';
import '../common/tag_filter_item.dart';
import '../map_result/map_search_result.dart';

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
          MapTag tag = cates[position];
          return Container(
            margin: position == 0
                ? const EdgeInsets.only(top: 4, left: 9)
                : const EdgeInsets.only(top: 4),
            child: GestureDetector(
                onTap: () async {
                  ref.read(storeProvider.notifier).getStoreList(
                      userLocation.latitude,
                      userLocation.longitude,
                      0,
                      tag.code,
                      "",
                      "STAR");
                  updateRecents(tag.tagName);
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
                          MapResultPage(tag.tagName, tag.code),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                child: TagFilterItem(
                  tag: tag.getEmojiTagName(),
                  shadow: true,
                  background: Colors.white,
                )),
          );
        },
      ),
    );
  }
}
