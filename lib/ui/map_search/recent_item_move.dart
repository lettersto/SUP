import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/map/map.dart';
import '../../providers/store/store_provider.dart';
import '../../utils/sharedPreference_util.dart';
import '../../utils/styles.dart';
import '../common/line_divider.dart';
import '../map_result/map_search_result.dart';

class RecentItemMove extends ConsumerStatefulWidget {
  final List<String> filteredRecent;

  const RecentItemMove(this.filteredRecent, {super.key});

  @override
  ConsumerState<RecentItemMove> createState() => _RecentItemMove();
}

class _RecentItemMove extends ConsumerState<RecentItemMove> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: widget.filteredRecent.length,
        itemBuilder: (BuildContext context, int position) {
          String filter = widget
              .filteredRecent[widget.filteredRecent.length - position - 1];

          return Container(
            color: Colors.white,
            child: Column(
              children: [
                LineDivider(
                  child: SizedBox(
                    height: 48,
                    child: GestureDetector(
                      onTap: () {
                        ref.read(storeProvider.notifier).getStoreList(
                            userLocation.latitude,
                            userLocation.longitude,
                            0,
                            0,
                            filter,
                            "STAR");
                        setState(() {
                          widget.filteredRecent.remove(filter);
                          widget.filteredRecent.add(filter);
                        });
                        updateRecents(filter);
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
        });
  }

  void openResultPage(String text) {
    /*ref.read(storeProvider.notifier).getStoreList(
        userLocation.latitude, userLocation.longitude, 0, 0, text, "STAR");*/
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, a1, a2) => MapResultPage(text, 0),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
