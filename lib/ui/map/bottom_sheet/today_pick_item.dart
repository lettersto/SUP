import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/providers/wish/wish_provider.dart';
import 'package:sup/ui/map/map_page.dart';
import 'package:sup/utils/sharedPreference_util.dart';

import '../../../models/map/today_pick.dart';
import '../../../models/wish/wish.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/styles.dart';

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
    List<Wish> wishes = ref.watch(wishProvider).list;

    return Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.store.storeName,
                          style: const TextStyle(color: AppColors.black)
                              .merge(TextStyles.bold18),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.redAccent,
                              size: 14,
                            ),
                            Text(
                              " ${widget.store.starAvg}  ",
                              style: const TextStyle(color: Colors.grey)
                                  .merge(TextStyles.regular14),
                            ),
                            const Icon(
                              Icons.circle,
                              size: 4,
                              color: AppColors.whiteGrey,
                            ),
                            Center(
                              child: Text(
                                "  방문자리뷰 ${Format.currency.format(widget.store.reviewCnt)} ",
                                style: const TextStyle(color: Colors.grey)
                                    .merge(TextStyles.regular14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
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
                          onPressed: () async {
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

                              //TODO 즐겨찾기 위치 응답으로 받으면 처리하기
                              context
                                  .findAncestorStateOfType<MapPageState>()
                                  ?.addMarker(wishes);
                            }

                            widget.store.isWish = !widget.store.isWish;
                          },
                        ),
                        const Icon(
                          size: 20,
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
            margin: const EdgeInsets.fromLTRB(18, 10, 18, 0),
            height: 1,
            color: AppColors.grayTransparent2,
          )
        ]));
  }
}
