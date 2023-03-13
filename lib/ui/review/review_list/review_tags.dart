import 'package:flutter/material.dart';

import '../../../utils/enums.dart';

import '../../common/tag_item.dart';

class ReviewTags extends StatefulWidget {
  final List<Map<String, String>> tags;
  final Color tagColor;
  final Color tagTextColor;
  final ReviewMode mode;

  const ReviewTags({
    Key? key,
    required this.tags,
    required this.tagColor,
    required this.tagTextColor,
    this.mode = ReviewMode.main,
  }) : super(key: key);

  @override
  State<ReviewTags> createState() => _ReviewTagsState();
}

class _ReviewTagsState extends State<ReviewTags>
    with AutomaticKeepAliveClientMixin {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      alignment: Alignment.topLeft,
      child: Wrap(
        runSpacing: 4.0,
        spacing: 8.0,
        children: [
          if (widget.tags.length == 1)
            TagItem(
              tag: widget.tags[0],
              tagColor: widget.tagColor,
              tagTextColor: widget.tagTextColor,
            )
          else if (widget.tags.length > 1 &&
              !_isOpen &&
              !(widget.mode == ReviewMode.detail))
            Row(
              children: [
                TagItem(
                  tag: widget.tags[0],
                  tagColor: widget.tagColor,
                  tagTextColor: widget.tagTextColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isOpen = true;
                    });
                  },
                  child: TagItem(
                    tag: const {'emoji': '+', 'title': ''},
                    tagColor: widget.tagColor,
                    tagTextColor: widget.tagTextColor,
                  ),
                ),
              ],
            )
          else
            ...widget.tags.map((tag) {
              return TagItem(
                tag: tag,
                tagColor: widget.tagColor,
                tagTextColor: widget.tagTextColor,
              );
            }).toList(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
