import 'package:flutter/material.dart';
import 'package:sup/utils/styles.dart';

class ResultSearchBar extends StatefulWidget {
  const ResultSearchBar(this.keyword, {super.key});

  final String keyword;

  @override
  State<ResultSearchBar> createState() => ResultSearchBarState();
}

class ResultSearchBarState extends State<ResultSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(56, 0, 18, 8),
        alignment: Alignment.bottomCenter,
        child: TextField(
          onTap: () {
            Navigator.of(context).pop();
          },
          decoration: InputDecoration(
              hintText: widget.keyword,
              border: InputBorder.none,
              hintStyle: TextStyles.regular16
                  .merge(const TextStyle(color: Colors.black))),
        ));
  }
}
