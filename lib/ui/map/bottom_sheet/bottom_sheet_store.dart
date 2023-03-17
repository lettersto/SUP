import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/providers/store/store_detail_provider.dart';
import 'package:sup/providers/store/store_provider.dart';
import 'package:sup/providers/wish/wish_provider.dart';
import 'package:sup/ui/map/map_page.dart';
import 'package:sup/utils/sharedPreference_util.dart';

import '../../../models/map/store.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/styles.dart';
import '../../review/review_page.dart';

class MapBottomSheet extends ConsumerStatefulWidget {
  final bool visibility;

  const MapBottomSheet(this.visibility, {super.key});

  @override
  ConsumerState<MapBottomSheet> createState() => _MapBottomSheet();
}

class _MapBottomSheet extends ConsumerState<MapBottomSheet> {
  double _bodyHeight = 200;

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
                      const BoxConstraints(maxHeight: 800, minHeight: 200),
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
                        _bodyHeight = 200;
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      storeDetail.storeName,
                                      style:
                                          const TextStyle(color: AppColors.blue)
                                              .merge(TextStyles.semiBold16),
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
                                          style: const TextStyle(
                                                  color: Colors.grey)
                                              .merge(TextStyles.regular14),
                                        ),
                                        const Icon(
                                          Icons.circle,
                                          size: 4,
                                          color: AppColors.whiteGrey,
                                        ),
                                        Text(
                                          "  방문자리뷰 ${Format.currency.format(storeDetail.reviewCnt)} ",
                                          style: const TextStyle(
                                                  color: Colors.grey)
                                              .merge(TextStyles.regular14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      iconSize: 28,
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 0, 4, 0),
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
                                                  SharedPreferenceUtil().userNo,
                                                  storeDetail.storeNo);
                                          context
                                              .findRootAncestorStateOfType<
                                                  MapPageState>()
                                              ?.deleteMarker(
                                                  storeDetail.storeNo);
                                        } else {
                                          ref
                                              .read(wishProvider.notifier)
                                              .postWish(
                                                  SharedPreferenceUtil().userNo,
                                                  storeDetail.storeNo);

                                          context
                                              .findRootAncestorStateOfType<
                                                  MapPageState>()
                                              ?.addWishMarker(
                                                  ref.read(wishProvider).list);
                                        }
                                        ref
                                            .read(storeDetailProvider.notifier)
                                            .getStoreDetail(storeDetail.storeNo,
                                                SharedPreferenceUtil().userNo);

                                        setState(() {
                                          storeDetail.isWish =
                                              !storeDetail.isWish;
                                        });
                                      },
                                    ),
                                    const Icon(
                                      size: 24,
                                      Icons.share,
                                      color: Colors.black54,
                                    )
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
