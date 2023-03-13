import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sup/ui/map_result/map_search_result.dart';
import 'package:sup/ui/map_search/recent_list.dart';
import '../../utils/styles.dart';

class MapSearchPage extends StatefulWidget {
  const MapSearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MapSearchState();
}

class MapSearchState extends State<MapSearchPage> {
  List<String> recents = [];
  List<String> filteredRecent = [];
  Timer? _debounce;
  String keyword = "";

  _onSearchChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      //send text to server

      //show filtered list (recent)
      _runFilter(text);
      //show filtered list (server)
    });
  }

  void _runFilter(String keyword) {
    setState(() {
      filteredRecent =
          recents.where((recent) => RegExp(keyword).hasMatch(recent)).toList();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setRecents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          elevation: 1,
          leading: Transform.scale(
            scale: 0.7,
            child: IconButton(
                icon: SvgPicture.asset("assets/icons/back.svg"),
                color: AppColors.black,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          flexibleSpace: Container(
              margin: const EdgeInsets.fromLTRB(56, 0, 18, 8),
              alignment: Alignment.bottomCenter,
              child: TextField(
                style: TextStyles.regular16
                    .merge(const TextStyle(color: Colors.black)),
                autofocus: true,
                onChanged: (text) {
                  _onSearchChanged(text);
                  keyword = text;
                },
                onSubmitted: (text) {
                  if (text.isNotEmpty) {
                    updateRecents(text);
                    setRecents();
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            MapResultPage(text),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                    hintText: "장소, 가게명 검색",
                    border: InputBorder.none,
                    hintStyle: TextStyles.medium16
                        .merge(TextStyle(color: Colors.grey.shade400))),
              )),
        ),
        body: Recents(keyword, filteredRecent));
  }

  void updateRecents(String text) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getStringList('recents') == null) {
      prefs.setStringList('recents', <String>[text]);
    } else {
      List<String>? recents = prefs.getStringList('recents');
      if (!recents!.contains(text)) {
        recents?.add(text);
        if (recents.length == 20) {
          recents.removeAt(0);
        }
      } else {
        recents.remove(text);
        recents.add(text);
      }
      prefs.setStringList('recents', recents);
    }
  }

  void setRecents() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      if (prefs.getStringList('recents') != null) {
        recents = prefs.getStringList('recents')!;
      }

      _runFilter("");
    });
  }
}
