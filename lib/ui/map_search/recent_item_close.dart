import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/map/map.dart';
import '../../providers/store/store_provider.dart';
import '../../utils/sharedPreference_util.dart';
import '../../utils/styles.dart';
import '../common/line_divider.dart';
import '../map_result/map_search_result.dart';

class RecentItemClose extends ConsumerStatefulWidget {
  final List<String> filteredRecent;

  const RecentItemClose(this.filteredRecent, {super.key});

  @override
  ConsumerState<RecentItemClose> createState() => _RecentItemClose();
}

class _RecentItemClose extends ConsumerState<RecentItemClose> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: widget.filteredRecent.length,
        itemBuilder: (BuildContext context, int position) {
          String recent = widget
              .filteredRecent[widget.filteredRecent.length - position - 1];
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
                                setState(() {
                                  widget.filteredRecent.remove(recent);
                                  widget.filteredRecent.add(recent);
                                });
                                updateRecents(recent);
                                openResultPage(recent);

                                ref.read(storeProvider.notifier).getStoreList(
                                    userLocation.latitude,
                                    userLocation.longitude,
                                    0,
                                    0,
                                    recent,
                                    "STAR");
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
                                  widget.filteredRecent.length - position - 1);
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
        });
  }

  void openResultPage(String text) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, a1, a2) => MapResultPage(text, 0),
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
