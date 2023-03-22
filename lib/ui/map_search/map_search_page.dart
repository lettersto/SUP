import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/map/map.dart';
import '../../providers/store/store_provider.dart';
import '../../utils/sharedPreference_util.dart';
import '../../utils/styles.dart';
import '../map_result/map_search_result.dart';
import 'recent_list.dart';

class MapSearchPage extends ConsumerStatefulWidget {
  const MapSearchPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MapSearchState();
}

class MapSearchState extends ConsumerState<MapSearchPage> {
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
                    ref.read(storeProvider.notifier).getStoreList(
                        userLocation.latitude,
                        userLocation.longitude,
                        0,
                        0,
                        text,
                        "STAR");
                    updateRecents(text);
                    setRecents();
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            MapResultPage(text, 0),
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
