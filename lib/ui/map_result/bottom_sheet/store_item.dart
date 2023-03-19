import 'package:flutter/material.dart';
import 'package:sup/ui/map_result/bottom_sheet/review_page_view.dart';
import '../../../models/map/store.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/styles.dart';
import '../../review/review_page.dart';

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

    return GestureDetector(
      onTap: () {
        /*Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReviewPage(widget.store.storeNo)),
        );*/
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
                      Text(
                        widget.store.storeName,
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
                            " ${widget.store.starAvg}  ",
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
