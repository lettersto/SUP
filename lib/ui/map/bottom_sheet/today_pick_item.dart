import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/map/today_pick.dart';
import '../../../providers/store/store_detail_provider.dart';
import '../../../providers/wish/wish_provider.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/sharedPreference_util.dart';
import '../../../utils/styles.dart';
import '../../review/review_page.dart';
import '../map_page.dart';

class TodayPickItem extends ConsumerStatefulWidget {
  final TodayPick store;

  const TodayPickItem(this.store, {super.key});

  @override
  ConsumerState<TodayPickItem> createState() => _TodayPickItem();
}

class _TodayPickItem extends ConsumerState<TodayPickItem> {
  @override
  Widget build(BuildContext context) {
    double imageWidth = (MediaQuery.of(context).size.width - 32);

    return GestureDetector(
      onTap: () {
        ref.read(storeDetailProvider.notifier).getStoreDetail(
            widget.store.storeNo, SharedPreferenceUtil().userNo);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReviewPage(widget.store.storeNo)),
        );
      },
      child: Container(
          color: Colors.white,
          child: Column(children: [
            SizedBox(
              height: 220,
              child: PageView.builder(
                  itemCount: widget.store.imgs.length,
                  pageSnapping: true,
                  itemBuilder: (context, pagePosition) {
                    return Stack(
                      children: [
                        Container(
                            height: 220,
                            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  widget.store.imgs[pagePosition],
                                  fit: BoxFit.cover,
                                  width: imageWidth,
                                  height: 220,
                                ))),
                        Positioned(
                            right: 24,
                            top: 24,
                            child: Container(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: AppColors.blackTransparent,
                                ),
                                child: Row(children: [
                                  Text(
                                    (pagePosition + 1).toString(),
                                    style: TextStyles.regular14.merge(
                                        const TextStyle(color: Colors.white)),
                                  ),
                                  Text(
                                    "/${widget.store.imgs.length.toString()}",
                                    style: TextStyles.regular14.merge(TextStyle(
                                        color: Colors.white.withOpacity(0.6))),
                                  ),
                                ])))
                      ],
                    );
                  }),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.store.storeName,
                                style: const TextStyle(color: AppColors.black)
                                    .merge(TextStyles.bold18),
                              ),
                              Text("  ${widget.store.category}",
                                  style: const TextStyle(color: AppColors.gray)
                                      .merge(TextStyles.regular14)),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                iconSize: 24,
                                padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                icon: Container(
                                  child: widget.store.isWish == true
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
                                  if (widget.store.isWish) {
                                    ref.read(wishProvider.notifier).deleteWish(
                                        SharedPreferenceUtil().userNo,
                                        widget.store.storeNo);

                                    context
                                        .findAncestorStateOfType<MapPageState>()
                                        ?.deleteMarker(widget.store.storeNo);
                                  } else {
                                    ref.read(wishProvider.notifier).postWish(
                                        SharedPreferenceUtil().userNo,
                                        widget.store.storeNo);

                                    context
                                        .findAncestorStateOfType<MapPageState>()
                                        ?.addSingleWish(widget.store.storeNo,
                                            widget.store.lat, widget.store.lng);
                                  }

                                  widget.store.isWish = !widget.store.isWish;
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.store.address,
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
                            color: Colors.pinkAccent,
                            size: 14,
                          ),
                          Text(
                            " ${widget.store.starAvg}  ",
                            style: const TextStyle(color: Colors.black)
                                .merge(TextStyles.regular14),
                          ),
                          Text(
                            " / ",
                            style: const TextStyle(
                                    color: AppColors.grayTransparent30)
                                .merge(TextStyles.regular12),
                          ),
                          Center(
                            child: Row(
                              children: [
                                Text(
                                  "  방문자리뷰 ",
                                  style: const TextStyle(color: Colors.black)
                                      .merge(TextStyles.regular14),
                                ),
                                Text(
                                  "${Format.currency.format(widget.store.reviewCnt)} ",
                                  style: const TextStyle(color: Colors.black)
                                      .merge(TextStyles.semiBold14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18, 10, 18, 0),
              height: 1,
              color: AppColors.grayTransparent2,
            )
          ])),
    );
  }
}
