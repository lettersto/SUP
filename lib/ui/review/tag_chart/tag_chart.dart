import 'package:flutter/material.dart';
import 'package:sup/ui/review/filter_buttons/review_text_button.dart';

import '../../../utils/styles.dart';

import './tag_chart_bar.dart';

const _dummyTags = [
  {'title': '💰 가성비가 좋아요', 'percent': 0.85},
  {'title': '👨‍🍳 특별한 메뉴가 있어요', 'percent': 0.75},
  {'title': '🤤 음식이 맛있어요', 'percent': 0.50},
  {'title': '🍙 혼자 가기 좋아요', 'percent': 0.45},
  {'title': '🔎 종류가 다양해요', 'percent': 0.43},
  {'title': '📸 사진이 잘 나와요', 'percent': 0.32},
  {'title': '💬 대화하기 좋아요', 'percent': 0.31},
  {'title': '🏞️ 뷰가 좋아요', 'percent': 0.20},
  {'title': '💻 집중하기 좋아요', 'percent': 0.14},
  {'title': '🛋️ 인테리어가 멋져요', 'percent': 0.14},
  {'title': '🚻 화장실이 깨끗해요', 'percent': 0.1},
  {'title': '🪑 좌석이 편해요', 'percent': 0.1},
  {'title': '🅿️ 주차하기 편해요', 'percent': 0.1},
  {'title': '💓 친절해요', 'percent': 0.1},
  {'title': '✨ 매장이 청결해요', 'percent': 0.1},
];

class TagChart extends StatefulWidget {
  const TagChart({Key? key}) : super(key: key);

  @override
  State<TagChart> createState() => _TagChartState();
}

class _TagChartState extends State<TagChart> {
  final double _itemHeight = 48;
  List<Map<String, dynamic>> _tags = _dummyTags.sublist(0, 5);
  int _chartItemStartIdx = 0;
  int delta = 5;

  void _pressHandler() {
    if (_chartItemStartIdx >= 10) return;
    setState(() {
      _chartItemStartIdx += delta;
      _tags = _tags +
          _dummyTags.sublist(_chartItemStartIdx, _chartItemStartIdx + 5);
    });
  }

  void _resetChartIdx() {
    setState(() {
      _chartItemStartIdx = 0;
      _tags = _dummyTags.sublist(0, 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemExtent: _itemHeight,
          children: [
            ..._tags.map((tag) => TagChartBar(tag: tag)).toList(),
            Stack(children: [
              if (_chartItemStartIdx < 10) Container(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: _pressHandler,
                  icon: const Icon(
                    Icons.expand_more_rounded,
                    size: 32,
                    color: AppColors.gray,
                  ),
                ),
              ),
              if (_chartItemStartIdx > 0) Container(
                alignment: Alignment.centerRight,
                child: ReviewTextButton(
                  text: '접기',
                  tapHandler: _resetChartIdx,
                ),
              ),
            ],)
          ],
        ),
      ),
    );
  }
}
