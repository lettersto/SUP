import 'package:flutter/material.dart';
import '../../../utils/styles.dart';

class ReviewPageView extends StatefulWidget {
  final List<String> reviews;

  const ReviewPageView(this.reviews, {super.key});

  @override
  State<ReviewPageView> createState() => _ReviewPageView();
}

class _ReviewPageView extends State<ReviewPageView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 76,
        child: PageView.builder(
            padEnds: false,
            controller: PageController(viewportFraction: 0.9, initialPage: 0),
            itemCount: widget.reviews.length,
            pageSnapping: true,
            itemBuilder: (context, pagePosition) {
              String review = widget.reviews[pagePosition];
              return Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: AppColors.blueGrey,
                ),
                padding: const EdgeInsets.all(12),
                margin: (pagePosition == widget.reviews.length - 1)
                    ? const EdgeInsets.only(left: 16, right: 16, top: 6)
                    : const EdgeInsets.only(left: 16, right: 8, top: 6),
                child: Text(
                  "❝$review",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.regular14,
                ),
              );
            }));
  }
}
