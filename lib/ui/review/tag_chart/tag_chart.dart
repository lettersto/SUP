import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/review/tag_chart.dart';
import '../../../providers/review/review_provider.dart';
import '../../../utils/styles.dart';
import '../filter_buttons/review_text_button.dart';
import './tag_chart_bar.dart';

class TagChart extends ConsumerStatefulWidget {
  final int storeNo;

  const TagChart({
    super.key,
    required this.storeNo,
  });

  @override
  ConsumerState<TagChart> createState() => _TagChartState();
}

class _TagChartState extends ConsumerState<TagChart> {
  final double _itemHeight = 48;
  int _chartItemStartIdx = 0;
  int delta = 5;
  List<TagChartItemModel> _firstSlicedTags = [];
  List<TagChartItemModel> _secondSlicedTags = [];
  List<TagChartItemModel> _thirdSlicedTags = [];

  @override
  void initState() {
    ref.read(reviewChartProvider.notifier).getReviewChart(widget.storeNo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tags = ref.watch(reviewChartProvider).tags;
    if (tags.length >= 15) {
      _firstSlicedTags = tags.sublist(0, 5);
      _secondSlicedTags = tags.sublist(5, 10);
      _thirdSlicedTags = tags.sublist(10, 15);
    }

    void pressHandler() {
      if (_chartItemStartIdx >= 10) return;
      setState(() {
        _chartItemStartIdx += delta;
      });
    }

    void resetChartIdx() {
      setState(() {
        _chartItemStartIdx = 0;
      });
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemExtent: _itemHeight,
          children: [
            ..._firstSlicedTags
                .map((tag) => TagChartBar(
                      tag: tag,
                    ))
                .toList(),
            if (_chartItemStartIdx >= 5)
              ..._secondSlicedTags
                  .map((tag) => TagChartBar(
                        tag: tag,
                      ))
                  .toList(),
            if (_chartItemStartIdx >= 10)
              ..._thirdSlicedTags
                  .map((tag) => TagChartBar(
                        tag: tag,
                      ))
                  .toList(),
            Stack(
              children: [
                if (_chartItemStartIdx < 10)
                  Container(
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: pressHandler,
                      icon: const Icon(
                        Icons.expand_more_rounded,
                        size: 32,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                if (_chartItemStartIdx > 0)
                  Container(
                    alignment: Alignment.centerRight,
                    child: ReviewTextButton(
                      text: '접기',
                      tapHandler: resetChartIdx,
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
