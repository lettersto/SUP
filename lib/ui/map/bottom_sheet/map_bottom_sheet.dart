import 'package:flutter/material.dart';

import '../../../models/store.dart';
import '../../../utils/styles.dart';
import '../../review/review_page.dart';

class MapBottomSheet extends StatefulWidget {
  final Store store;

  const MapBottomSheet(this.store, {super.key});

  @override
  State<MapBottomSheet> createState() => _MapBottomSheet();
}

class _MapBottomSheet extends State<MapBottomSheet> {
  double _bodyHeight = 200;
  final String defaultImage =
      'https://user-images.githubusercontent.com/33195517/223589375-44917834-d98c-4078-bb52-568b265d195d.png';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Image image;
    double imageWidth = (MediaQuery.of(context).size.width - 36) / 3;

    return Positioned(
        bottom: 0.0,
        child: GestureDetector(
            onVerticalDragUpdate: (DragUpdateDetails data) {
              double draggedAmount = size.height - data.globalPosition.dy;
              setState(() {
                _bodyHeight = draggedAmount;
                if (_bodyHeight >= 800) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReviewPage()),
                  );
                }
              });
            },
            child: AnimatedContainer(
              constraints: const BoxConstraints(maxHeight: 800, minHeight: 200),
              onEnd: () {
                if (_bodyHeight >= 600) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReviewPage()),
                  );
                  setState(() {
                    _bodyHeight = 0;
                  });
                } else {
                  setState(() {
                    _bodyHeight = 180;
                  });
                }
              },
              duration: const Duration(milliseconds: 120),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 0.7,
                        spreadRadius: 0.7,
                        color: Colors.grey.withOpacity(0.7))
                  ],
                  color: Colors.white,
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12))),
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
                                  widget.store.name,
                                  style: const TextStyle(color: AppColors.blue)
                                      .merge(TextStyles.medium16),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.redAccent,
                                      size: 14,
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
                                  iconSize: 24,
                                  padding:
                                  const EdgeInsets.fromLTRB(4, 0, 4, 0),
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
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...widget.store.urls
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
            )));
  }
}