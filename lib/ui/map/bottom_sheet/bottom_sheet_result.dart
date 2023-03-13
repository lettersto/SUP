import 'package:flutter/material.dart';
import 'package:sup/ui/map/bottom_sheet/store_item.dart';
import 'package:sup/ui/map/bottom_sheet/today_pick_item.dart';

import '../../../models/store.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';
import '../../common/tag_filter_item.dart';

class ResultBottomSheet extends StatefulWidget {
  final ScrollController sc;
  final bool visibility;

  const ResultBottomSheet(this.sc, this.visibility, {super.key});

  @override
  State<ResultBottomSheet> createState() => _ResultBottomSheet();
}

class _ResultBottomSheet extends State<ResultBottomSheet> {
  final List<Store> _stores = [
    Store("name", 0, 0, "3.33", 0, false),
    Store("맘스터치", 37.563063, 126.831237, "4.37", 1218, false),
    Store("산청숯불가든", 37.561036, 126.836975, "3.3", 344, true),
    Store("유나식당", 37.561036, 126.839975, "4.66", 13, false),
    Store("유나식당", 37.561036, 126.839975, "4.66", 13, false),
    Store("유나식당", 37.561036, 126.839975, "4.66", 13, false),
  ];

  @override
  Widget build(BuildContext context) {
    return widget.visibility
        ? ListView.builder(
        physics: const ClampingScrollPhysics(),
        controller: widget.sc,
        itemCount: _stores.length,
        itemBuilder: (BuildContext context, int position) {
          if (position == 0) {
            return Column(
              children: [
                Container(
                  height: 15,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, -0.05),
                            blurRadius: 0.7,
                            spreadRadius: 0.7,
                            color: Colors.grey.withOpacity(0.7))
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
                Stack(
                  children: [
                    Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.fromLTRB(
                                    16, 18, 16, 0),
                                child: Row(
                                  children: [],
                                )),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 16),
                              height: 36,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: tags.length,
                                itemBuilder:
                                    (BuildContext context, int position) {
                                  return Container(
                                    margin: const EdgeInsets.only(
                                        top: 4, right: 6),
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: TagFilterItem(
                                          tag: tags[position],
                                          shadow: false,
                                          background: AppColors.pink15,
                                        )),
                                  );
                                },
                              ),
                            ),
                          ],
                        )),
                    Center(
                      child: Container(
                        width: 40,
                        height: 4.5,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.7),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10))),
                      ),
                    )
                  ],
                ),
              ],
            );
          }
          return StoreItem(_stores[position]);
        })
        : Container();
  }
}
