import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/models/map/map.dart';
import 'package:sup/providers/store/store_provider.dart';
import 'package:sup/ui/map_result/bottom_sheet/store_item.dart';
import 'package:sup/ui/map_result/bottom_sheet/tag_result.dart';
import 'package:sup/utils/app_utils.dart';
import '../../../models/map/store.dart';
import '../../../providers/store/store_detail_provider.dart';
import '../../../utils/sharedPreference_util.dart';
import '../../../utils/styles.dart';
import '../map_search_result.dart';

class ResultBottomSheet extends ConsumerStatefulWidget {
  final ScrollController sc;
  bool visibility;
  final int categoryNo;
  final String keyword;

  ResultBottomSheet(this.sc, this.visibility, this.categoryNo, this.keyword,
      {Key? key})
      : super(key: key);

  @override
  ConsumerState<ResultBottomSheet> createState() => ResultBottomSheetState();
}

class ResultBottomSheetState extends ConsumerState<ResultBottomSheet> {
  String order = "별점순";

  @override
  Widget build(BuildContext context) {
    List<Store> stores = ref.watch(storeProvider).list;

    /*if (stores.isEmpty) {
      context
          .findAncestorStateOfType<MapResultPageState>()
          ?.showResultBottomSheet();

      return Container(
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
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: const Center(
          child: Text(
            "일치하는 음식점이 없어요 🤔",
            style: TextStyles.regular14,
          ),
        ),
      );
    } else {
      widget.visibility = true;
    }*/

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
                        Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: TagResultList(
                                widget.categoryNo, widget.keyword)),
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
                                scrollToTop();
                                ref.read(storeProvider.notifier).getStoreList(
                                    userLocation.latitude,
                                    userLocation.longitude,
                                    0,
                                    widget.categoryNo,
                                    "",
                                    "STAR");
                                setState(() {
                                  order = "별점순";
                                });
                              },
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 16),
                              child: GestureDetector(
                                child: Text(
                                  "거리순",
                                  style: order == "거리순"
                                      ? TextStyles.orderSelected
                                      : TextStyles.orderUnselected,
                                ),
                                onTap: () {
                                  scrollToTop();

                                  ref.read(storeProvider.notifier).getStoreList(
                                      userLocation.latitude,
                                      userLocation.longitude,
                                      0,
                                      widget.categoryNo,
                                      "",
                                      "DIST");
                                  setState(() {
                                    order = "거리순";
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      controller: widget.sc,
                      itemCount: stores.length,
                      itemBuilder: (BuildContext context, int position) {
                        return StoreItem(stores[position]);
                      }),
                ),
              ),
            ],
          )
        : Container();
  }

  void scrollToTop() async {
    await Future.delayed(const Duration(milliseconds: 300));

    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.sc.animateTo(widget.sc.position.minScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn);
    });
  }
}
