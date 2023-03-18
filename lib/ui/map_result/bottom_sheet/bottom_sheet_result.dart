import 'package:flutter/material.dart';
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

  ResultBottomSheet(this.sc, this.visibility, this.categoryNo, {super.key});

  @override
  ConsumerState<ResultBottomSheet> createState() => _ResultBottomSheet();
}

class _ResultBottomSheet extends ConsumerState<ResultBottomSheet> {
  String order = "별점순";

  @override
  Widget build(BuildContext context) {
    List<Store> stores = ref.watch(storeProvider).list;

    if (stores.length == 1) {
      context
          .findAncestorStateOfType<MapResultPageState>()
          ?.showStoreDetailBottomSheet();

      ref
          .read(storeDetailProvider.notifier)
          .getStoreDetail(stores[0].storeNo, SharedPreferenceUtil().userNo);

      return Container();
    } else if (stores.isEmpty) {
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
    }

    return widget.visibility
        ? ListView.builder(
            physics: const ClampingScrollPhysics(),
            controller: widget.sc,
            itemCount: stores.length + 1,
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
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                    ),
                    Stack(
                      children: [
                        Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                TagResultList(widget.categoryNo),
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
                                        ref
                                            .read(storeProvider.notifier)
                                            .getStoreList(
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
                                          ref
                                              .read(storeProvider.notifier)
                                              .getStoreList(
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
                            )),
                      ],
                    ),
                  ],
                );
              }
              return StoreItem(stores[position - 1]);
            })
        : Container();
  }
}
