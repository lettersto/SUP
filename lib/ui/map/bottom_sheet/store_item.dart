import 'package:flutter/material.dart';

import '../../../models/store.dart';
import '../../../utils/styles.dart';

class StoreItem extends StatefulWidget {
  final Store store;

  const StoreItem(this.store, {super.key});

  @override
  State<StoreItem> createState() => _StoreItem();
}

class _StoreItem extends State<StoreItem> {
  @override
  Widget build(BuildContext context) {
    double imageWidth = (MediaQuery.of(context).size.width - 36) / 3;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 16),
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
                    Text(
                      widget.store.name,
                      style: const TextStyle(color: AppColors.blue)
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
                          " ${widget.store.rate}  ",
                          style: const TextStyle(color: Colors.grey)
                              .merge(TextStyles.regular14),
                        ),
                        const Icon(
                          Icons.circle,
                          size: 4,
                          color: AppColors.whiteGrey,
                        ),
                        Text(
                          "  방문자리뷰 ${Format.currency.format(widget.store.reviewCnt)} ",
                          style: const TextStyle(color: Colors.grey)
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
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                      icon: Container(
                        child: widget.store.like == true
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
                        setState(() {
                          widget.store.like = !widget.store.like;
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
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...widget.store.urls
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

          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: AppColors.blueGrey,
            ),
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(left: 16, right: 16, top: 6),
            child: const Text(
              "❝"
              "그리고 아인슈페너, 플랫슈페너 크림이 엄청 쫀쫀하고 달달하고 커피도 맛있어요... 휘낭시에도 맛있어요 냠냠냠ㄴ먀먄먀얌냐",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.regular14,
            ),
          )
        ],
      ),
    );
  }
}
