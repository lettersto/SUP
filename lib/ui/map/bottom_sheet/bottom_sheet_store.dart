import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/map/map.dart';
import '../../../models/map/store.dart';
import '../../../providers/store/store_detail_provider.dart';
import '../../../providers/store/today_provider.dart';
import '../../../providers/wish/wish_provider.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/sharedPreference_util.dart';
import '../../../utils/styles.dart';
import '../../map_result/map_search_result.dart';
import '../../review/review_page.dart';
import '../map_page.dart';

class MapBottomSheet extends ConsumerStatefulWidget {
  bool visibility;

  MapBottomSheet(this.visibility, {super.key});

  @override
  ConsumerState<MapBottomSheet> createState() => _MapBottomSheet();
}

class _MapBottomSheet extends ConsumerState<MapBottomSheet> {
  double _bodyHeight = 240;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double imageWidth = (MediaQuery.of(context).size.width - 36) / 3;

    StoreDetail storeDetail = ref.watch(storeDetailProvider);

    return widget.visibility
        ? Positioned(
            bottom: 0.0,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReviewPage(storeDetail.storeNo)),
                  );
                },
                onVerticalDragUpdate: (DragUpdateDetails data) {
                  double draggedAmount = size.height - data.globalPosition.dy;
                  setState(() {
                    _bodyHeight = draggedAmount;
                    if (_bodyHeight >= 800) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReviewPage(storeDetail.storeNo)),
                      );
                    }
                  });
                },
                child: AnimatedContainer(
                  constraints:
                      const BoxConstraints(maxHeight: 800, minHeight: 240),
                  onEnd: () {
                    if (_bodyHeight >= 400) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReviewPage(storeDetail.storeNo)),
                      );
                      setState(() {
                        _bodyHeight = 0;
                      });
                    } else {
                      setState(() {
                        _bodyHeight = 240;
                      });
                    }
                  },
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.7,
                            spreadRadius: 0.7,
                            color: Colors.grey.withOpacity(0.7))
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12))),
                  width: MediaQuery.of(context).size.width,
                  height: _bodyHeight,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 40,
                        height: 4.5,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.7),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 6, 16, 8),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          storeDetail.storeName,
                                          style: const TextStyle(
                                                  color: AppColors.blue)
                                              .merge(TextStyles.semiBold16),
                                        ),
                                        Text("  ${storeDetail.category}",
                                            style: const TextStyle(
                                                    color: AppColors.gray)
                                                .merge(TextStyles.regular14)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          iconSize: 24,
                                          padding: const EdgeInsets.fromLTRB(
                                              4, 0, 4, 0),
                                          icon: Container(
                                            child: storeDetail.isWish == true
                                                ? const Icon(
                                                    Icons.star_rounded,
                                                    color: AppColors.pink60,
                                                  )
                                                : const Icon(
                                                    Icons.star_border_rounded,
                                                    color: AppColors.pink60,
                                                  ),
                                          ),
                                          onPressed: () {
                                            if (storeDetail.isWish) {
                                              ref
                                                  .read(wishProvider.notifier)
                                                  .deleteWish(
                                                      SharedPreferenceUtil()
                                                          .userNo,
                                                      storeDetail.storeNo);
                                              context
                                                  .findRootAncestorStateOfType<
                                                      MapPageState>()
                                                  ?.deleteMarker(
                                                      storeDetail.storeNo);
                                              context
                                                  .findRootAncestorStateOfType<
                                                      MapResultPageState>()
                                                  ?.deleteWishMarker(
                                                      storeDetail.storeNo);
                                            } else {
                                              ref
                                                  .read(wishProvider.notifier)
                                                  .postWish(
                                                      SharedPreferenceUtil()
                                                          .userNo,
                                                      storeDetail.storeNo);

                                              context
                                                  .findRootAncestorStateOfType<
                                                      MapPageState>()
                                                  ?.addSingleWish(
                                                      storeDetail.storeNo,
                                                      storeDetail.lat,
                                                      storeDetail.lng);
                                            }

                                            ref
                                                .read(todayProvider.notifier)
                                                .getTodayList(
                                                    SharedPreferenceUtil()
                                                        .userNo,
                                                    userLocation.latitude,
                                                    userLocation.longitude);

                                            ref
                                                .read(storeDetailProvider
                                                    .notifier)
                                                .getStoreDetail(
                                                    storeDetail.storeNo,
                                                    SharedPreferenceUtil()
                                                        .userNo);

                                            setState(() {
                                              storeDetail.isWish =
                                                  !storeDetail.isWish;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 40,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    storeDetail.address,
                                    style: const TextStyle(color: Colors.black)
                                        .merge(TextStyles.regular14),
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.redAccent,
                                      size: 15,
                                    ),
                                    Text(
                                      " ${storeDetail.starAvg}  ",
                                      style: const TextStyle(color: Colors.grey)
                                          .merge(TextStyles.regular14),
                                    ),
                                    const Icon(
                                      Icons.circle,
                                      size: 4,
                                      color: AppColors.whiteGrey,
                                    ),
                                    Text(
                                      "  방문자리뷰 ${Format.currency.format(storeDetail.reviewCnt)} ",
                                      style: const TextStyle(color: Colors.grey)
                                          .merge(TextStyles.regular14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...storeDetail.imgs
                                .map(
                                  (url) => Image.network(
                                    url,
                                    width: imageWidth,
                                    height: 94,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      )
                    ],
                  ),
                )))
        : Container();
  }
}
