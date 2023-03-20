import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/map/store.dart';
import '../../../providers/store/store_detail_provider.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/sharedPreference_util.dart';
import '../../../utils/styles.dart';
import '../../review/review_page_view.dart';
import '../map_search_result.dart';

class StoreItem extends ConsumerStatefulWidget {
  final Store store;

  const StoreItem(this.store, {super.key});

  @override
  ConsumerState<StoreItem> createState() => _StoreItem();
}

class _StoreItem extends ConsumerState<StoreItem> {
  @override
  Widget build(BuildContext context) {
    double imageWidth = (MediaQuery.of(context).size.width - 36) / 3;

    return GestureDetector(
      onTap: () {
        context.findAncestorStateOfType<MapResultPageState>()?.setState(() {
          selectedStoreNo = widget.store.storeNo;
        });
        context
            .findAncestorStateOfType<MapResultPageState>()
            ?.showStoreDetailBottomSheet();
        ref.read(storeDetailProvider.notifier).getStoreDetail(
            widget.store.storeNo, SharedPreferenceUtil().userNo);
      },
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              height: 1,
              color: AppColors.grayTransparent2,
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.store.storeName,
                            style: const TextStyle(color: AppColors.blue)
                                .merge(TextStyles.semiBold17),
                          ),
                          Text("  ${widget.store.category}",
                              style: const TextStyle(color: AppColors.gray)
                                  .merge(TextStyles.regular14)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pinkAccent,
                            size: 15,
                          ),
                          Text(
                            " ${widget.store.starAvg}  ",
                            style: const TextStyle(color: Colors.black)
                                .merge(TextStyles.regular14),
                          ),
                          const Icon(
                            Icons.circle,
                            size: 4,
                            color: AppColors.whiteGrey,
                          ),
                          Text(
                            "  방문자리뷰 ${Format.currency.format(widget.store.reviewCnt)} ",
                            style: const TextStyle(color: Colors.black54)
                                .merge(TextStyles.regular14),
                          ),
                          const Icon(
                            Icons.circle,
                            size: 4,
                            color: AppColors.whiteGrey,
                          ),
                          Text(
                            "  ${sqrt(widget.store.distance).round()}m ",
                            style: const TextStyle(color: Colors.pinkAccent)
                                .merge(TextStyles.medium14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...widget.store.imgs
                      .map(
                        (url) => ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              url,
                              width: imageWidth,
                              height: 140,
                              fit: BoxFit.cover,
                            )),
                      )
                      .toList(),
                ],
              ),
            ),
            ReviewPageView(widget.store.reviews)
          ],
        ),
      ),
    );
  }
}
