import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/map/map.dart';
import '../../../models/map/store.dart';
import '../../../providers/store/today_provider.dart';
import '../../../providers/wish/wish_provider.dart';
import '../../../utils/sharedPreference_util.dart';
import '../../../utils/styles.dart';
import '../../map_result/map_search_result.dart';
import '../map_page.dart';

class StarIcon extends ConsumerStatefulWidget {
  StoreDetail storeDetail;

  StarIcon(this.storeDetail, {super.key});

  @override
  ConsumerState<StarIcon> createState() => _StarIcon();
}

class _StarIcon extends ConsumerState<StarIcon> {
  bool isUpdateWish = false;
  late bool isWish;

  @override
  void initState() {
    super.initState();
    isWish = widget.storeDetail.isWish;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24,
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      icon: Container(
        child: isWish == true
            ? const Icon(
                Icons.star_rounded,
                color: AppColors.pink60,
              )
            : const Icon(
                Icons.star_border_rounded,
                color: AppColors.pink60,
              ),
      ),
      onPressed: () async {
        if (isUpdateWish) {
          return;
        } else {
          if (isWish) {
            removeMarker();
          } else {
            addMarker();
          }
        }
      },
    );
  }

  Future<void> removeMarker() async {
    if (isUpdateWish) {
      return;
    }

    setState(() {
      isWish = false;
      isUpdateWish = true;

      context
          .findRootAncestorStateOfType<MapPageState>()
          ?.deleteMarker(widget.storeDetail.storeNo);
      context
          .findRootAncestorStateOfType<MapResultPageState>()
          ?.deleteWishMarker(widget.storeDetail.storeNo);
    });

    try {
      await ref.watch(wishProvider.notifier).deleteWish(
          SharedPreferenceUtil().userNo, widget.storeDetail.storeNo);

      await ref.watch(todayProvider.notifier).getTodayList(
          SharedPreferenceUtil().userNo,
          userLocation.latitude,
          userLocation.longitude);
    } catch (e) {
      setState(() {
        isWish = true;

        context.findRootAncestorStateOfType<MapPageState>()?.addSingleWish(
            widget.storeDetail.storeNo,
            widget.storeDetail.lat,
            widget.storeDetail.lng);
      });
    } finally {
      isUpdateWish = false;
    }
  }

  Future<void> addMarker() async {
    if (isUpdateWish) {
      return;
    }

    setState(() {
      isWish = true;
      isUpdateWish = true;

      context.findRootAncestorStateOfType<MapPageState>()?.addSingleWish(
          widget.storeDetail.storeNo,
          widget.storeDetail.lat,
          widget.storeDetail.lng);
    });

    try {
      await ref
          .watch(wishProvider.notifier)
          .postWish(SharedPreferenceUtil().userNo, widget.storeDetail.storeNo);

      await ref.watch(todayProvider.notifier).getTodayList(
          SharedPreferenceUtil().userNo,
          userLocation.latitude,
          userLocation.longitude);
    } catch (e) {
      setState(() {
        isWish = false;

        context
            .findRootAncestorStateOfType<MapPageState>()
            ?.deleteMarker(widget.storeDetail.storeNo);
        context
            .findRootAncestorStateOfType<MapResultPageState>()
            ?.deleteWishMarker(widget.storeDetail.storeNo);
      });
    } finally {
      isUpdateWish = false;
    }
  }
}
