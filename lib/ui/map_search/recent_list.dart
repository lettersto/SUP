import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sup/ui/map_search/recent_item_move.dart';
import 'package:sup/ui/map_search/recent_item_close.dart';
import '../map_result/map_search_result.dart';

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
            ? RecentItemClose(widget.filteredRecent)
            : RecentItemMove(widget.filteredRecent));
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
