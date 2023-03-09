import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

import '../../common/tag_item.dart';

class ReviewTags extends StatefulWidget {
  final List<Map<String, String>> tags;

  const ReviewTags({
    Key? key,
    required this.tags,
  }) : super(key: key);

  @override
  State<ReviewTags> createState() => _ReviewTagsState();
}

class _ReviewTagsState extends State<ReviewTags> with AutomaticKeepAliveClientMixin {
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
            TagItem(tag: widget.tags[0])
          else if (widget.tags.length > 1 && !_isOpen)
            Row(
              children: [
                TagItem(tag: widget.tags[0]),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isOpen = true;
                    });
                  },
                  child: const TagItem(
                    tag: {'emoji': '+', 'title': ''},
                  ),
                ),
              ],
            )
          else
            ...widget.tags.map((tag) {
              return TagItem(tag: tag);
            }).toList(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
