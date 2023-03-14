import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sup/ui/map/bottom_sheet/today_pick_item.dart';
import 'package:sup/utils/sharedPreference_util.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.visibility
        ? ListView.builder(
            physics: const ClampingScrollPhysics(),
            controller: widget.sc,
            itemCount: stores.length,
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
                                          SharedPreferenceUtil().nickname,
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
              return TodayPickItem(stores[position]);
            })
        : Container();
  }
}
