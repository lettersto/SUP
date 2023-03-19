import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/ui/map/bottom_sheet/today_pick_item.dart';
import 'package:sup/utils/sharedPreference_util.dart';
import '../../../models/map/today_pick.dart';
import '../../../providers/store/today_provider.dart';
import '../../../utils/styles.dart';

class TodayBottomSheet extends ConsumerStatefulWidget {
  final ScrollController sc;
  final bool visibility;
  final String address;

  const TodayBottomSheet(this.sc, this.visibility, this.address, {super.key});

  @override
  ConsumerState<TodayBottomSheet> createState() => _TodayBottomSheet();
}

class _TodayBottomSheet extends ConsumerState<TodayBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TodayResponse todays = ref.watch(todayProvider);

    return widget.visibility
        ? Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
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
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12))),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 16),
                            width: 40,
                            height: 4.5,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.7),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                          ),
                        ),
                        Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.fromLTRB(16, 18, 16, 0),
                            child: Text(
                              widget.address,
                              style: const TextStyle(color: Colors.black)
                                  .merge(TextStyles.bold16),
                            )),
                        Container(
                            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Row(
                              children: [
                                Text(
                                  SharedPreferenceUtil().nickname,
                                  style:
                                      const TextStyle(color: Colors.pinkAccent)
                                          .merge(TextStyles.medium20),
                                ),
                                Text("님을 위한 ",
                                    style: const TextStyle(color: Colors.black)
                                        .merge(TextStyles.medium20)),
                                Text("오늘의 PICK!",
                                    style: const TextStyle(color: Colors.black)
                                        .merge(TextStyles.bold20))
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      controller: widget.sc,
                      itemCount: todays.list.length,
                      itemBuilder: (BuildContext context, int position) {
                        return TodayPickItem(todays.list[position]);
                      }),
                ),
              )
            ],
          )
        : Container();
  }
}
