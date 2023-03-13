import 'package:flutter/material.dart';
import 'package:sup/ui/map/bottom_sheet/today_pick_item.dart';

import '../../../models/store.dart';
import '../../../utils/styles.dart';

class TodayBottomSheet extends StatefulWidget {
  final ScrollController sc;
  final bool visibility;
  final String address;

  const TodayBottomSheet(this.sc, this.visibility, this.address, {super.key});

  @override
  State<TodayBottomSheet> createState() => _TodayBottomSheet();
}

class _TodayBottomSheet extends State<TodayBottomSheet> {
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
                                      children: [
                                        Text(
                                          widget.address,
                                          style: const TextStyle(
                                                  color: Colors.black)
                                              .merge(TextStyles.bold16),
                                        ),
                                      ],
                                    )),
                                Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "송유나",
                                          style: const TextStyle(
                                                  color: Colors.pinkAccent)
                                              .merge(TextStyles.medium20),
                                        ),
                                        Text("님을 위한 ",
                                            style: const TextStyle(
                                                    color: Colors.black)
                                                .merge(TextStyles.medium20)),
                                        Text("오늘의 PICK!",
                                            style: const TextStyle(
                                                    color: Colors.black)
                                                .merge(TextStyles.bold20))
                                      ],
                                    )),
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
              return TodayPickItem(_stores[position]);
            })
        : Container();
  }
}
