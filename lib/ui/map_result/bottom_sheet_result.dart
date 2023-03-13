import 'package:flutter/material.dart';
import 'package:sup/ui/map/bottom_sheet/store_item.dart';
import 'package:sup/ui/map_result/tag_result.dart';
import '../../models/store.dart';
import '../../utils/styles.dart';

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

  String order = "별점순";

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
                      height: 16,
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
                                const TagResultList(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      child: Text(
                                        "별점순",
                                        style: order == "별점순"
                                            ? TextStyles.orderSelected
                                            : TextStyles.orderUnselected,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          //TODO get store list ordered by rating
                                          order = "별점순";
                                        });
                                      },
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, right: 16),
                                      child: GestureDetector(
                                        child: Text(
                                          "거리순",
                                          style: order == "거리순"
                                              ? TextStyles.orderSelected
                                              : TextStyles.orderUnselected,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            //TODO get store list ordered by dist
                                            order = "거리순";
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
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