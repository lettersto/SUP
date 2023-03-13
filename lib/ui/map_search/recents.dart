import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sup/ui/common/line_divider.dart';

import '../../utils/styles.dart';
import 'map_search_result.dart';

class Recents extends StatefulWidget {
  final String keyword;
  final List<String> filteredRecent;

  const Recents(this.keyword, this.filteredRecent, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => RecentsState();
}

class RecentsState extends State<Recents> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.keyword.isEmpty
            ? ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: widget.filteredRecent.length,
                itemBuilder: (BuildContext context, int position) {
                  String recent = widget.filteredRecent[
                      widget.filteredRecent.length - position - 1];
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        LineDivider(
                          child: SizedBox(
                            height: 48,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.search,
                                    color: AppColors.gray.withOpacity(0.7),
                                    size: 16,
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: GestureDetector(
                                      onTap: () {
                                        openResultPage(recent);
                                      },
                                      child: Text(
                                        recent,
                                        style: TextStyles.regular16,
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      deleteRecent(
                                          widget.filteredRecent.length -
                                              position -
                                              1);
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: AppColors.gray.withOpacity(0.7),
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })
            : ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: widget.filteredRecent.length,
                itemBuilder: (BuildContext context, int position) {
                  String filter = widget.filteredRecent[
                      widget.filteredRecent.length - position - 1];

                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        LineDivider(
                          child: SizedBox(
                            height: 48,
                            child: GestureDetector(
                              onTap: () {
                                openResultPage(filter);
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.search,
                                      color: AppColors.gray.withOpacity(0.7),
                                      size: 16,
                                    ),
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: Text(
                                        filter,
                                        style: TextStyles.regular16,
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color: AppColors.gray.withOpacity(0.7),
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }));
  }

  void openResultPage(String text) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, a1, a2) => MapResultPage(text),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  void deleteRecent(int position) async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? recents = prefs.getStringList('recents');
    recents?.removeAt(position);
    prefs.setStringList('recents', recents!);

    setState(() {
      widget.filteredRecent.removeAt(position);
    });
  }
}
