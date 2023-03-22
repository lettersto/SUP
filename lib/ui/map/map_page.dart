import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/map/map.dart';
import '../../models/wish/wish.dart';
import '../../providers/store/store_detail_provider.dart';
import '../../providers/store/today_provider.dart';
import '../../providers/wish/wish_provider.dart';
import '../../utils/geo_network.dart';
import '../../utils/sharedPreference_util.dart';
import '../../utils/styles.dart';
import 'bottom_sheet/bottom_sheet_store.dart';
import 'bottom_sheet/bottom_sheet_today.dart';
import 'map_search_bar.dart';
import 'tag_map.dart';

BitmapDescriptor? wishImg;
BitmapDescriptor? starImg;
BitmapDescriptor? selectedImg;

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => MapPageState();
}

class MapPageState extends ConsumerState<MapPage> {
  GoogleMapController? _controller;
  int selectedWishNo = 0;

  late LatLng _initPosition;
  bool _isLoading = true;
  bool todayVisibility = true;
  bool storeVisibility = false;
  String address = "";
  Set<Marker> markers = {};

  @override
  void initState() {
    if (Platform.isIOS) {
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(), "assets/icons/marker_store_ios.png")
          .then((value) => starImg = value);
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(), "assets/icons/marker_ios.png")
          .then((value) => wishImg = value);
      BitmapDescriptor.fromAssetImage(const ImageConfiguration(),
              "assets/icons/marker_selected_ios.png")
          .then((value) => selectedImg = value);
    } else {
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(), "assets/icons/marker_store.png")
          .then((value) => starImg = value);
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(), "assets/icons/marker.png")
          .then((value) => wishImg = value);
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(), "assets/icons/marker_selected.png")
          .then((value) => selectedImg = value);
    }

    getCurrentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: Stack(fit: StackFit.expand, children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: (_isLoading)
                    ? const Center(child: CircularProgressIndicator())
                    : GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                              _initPosition.latitude, _initPosition.longitude),
                          zoom: 14.4746,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller = controller;
                        },
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        mapToolbarEnabled: false,
                        markers: markers,
                        onTap: (LatLng) => setState(() {
                          selectedWishNo = 0;
                          storeVisibility = false;
                          todayVisibility = true;
                        }),
                      )),
          ],
        ),
        Column(
          children: [
            const MapSearchBar(),
            const TagMapList(),
            Container(
              alignment: AlignmentDirectional.topEnd,
              margin: const EdgeInsets.fromLTRB(0, 12, 12, 0),
              child: FloatingActionButton.small(
                  elevation: 2,
                  backgroundColor: AppColors.pinkAccent,
                  onPressed: _goToCurrentPos,
                  child: const Icon(
                    Icons.location_searching,
                    size: 20,
                  )),
            ),
          ],
        ),
        DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.18,
            snapSizes: const [0.3, 1],
            snap: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return (_isLoading
                  ? Container()
                  : TodayBottomSheet(
                      scrollController, todayVisibility, address));
            }),
        MapBottomSheet(storeVisibility)
      ]),
    );
  }

  void addWishMarker(List<Wish> wishes) {
    markers.clear();

    for (int i = 0; i < wishes.length; i++) {
      Wish s = wishes[i];

      markers.add(Marker(
          markerId: MarkerId(s.storeNo.toString()),
          draggable: false,
          icon: selectedWishNo == s.storeNo ? selectedImg! : wishImg!,
          onTap: () async {
            await ref
                .read(storeDetailProvider.notifier)
                .getStoreDetail(s.storeNo, SharedPreferenceUtil().userNo);
            setState(() {
              selectedWishNo = s.storeNo;

              todayVisibility = false;
              storeVisibility = true;
            });
          },
          position: LatLng(s.lat, s.lng)));
    }
  }

  void addSingleWish(int storeNo, double lat, double lng) {
    setState(() {
      markers.add(Marker(
          markerId: MarkerId(storeNo.toString()),
          draggable: false,
          icon: wishImg!,
          onTap: () => setState(() {
                selectedWishNo = storeNo;

                ref
                    .read(storeDetailProvider.notifier)
                    .getStoreDetail(storeNo, SharedPreferenceUtil().userNo);

                todayVisibility = false;
                storeVisibility = true;
              }),
          position: LatLng(lat, lng)));
    });
  }

  void deleteMarker(int storeNo) {
    setState(() {
      Marker marker = markers
          .firstWhere((marker) => marker.markerId.value == storeNo.toString());
      markers.remove(marker);
    });
  }

  Future<Position> getCurrentLocation() async {
    await ref
        .read(wishProvider.notifier)
        .getWishList(SharedPreferenceUtil().userNo);

    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    _initPosition = LatLng(position.latitude, position.longitude);
    userLocation = MyLatLng(_initPosition.latitude, _initPosition.longitude);

    await ref.read(todayProvider.notifier).getTodayList(
        SharedPreferenceUtil().userNo,
        userLocation.latitude,
        userLocation.longitude);

    addWishMarker(ref.watch(wishProvider).list);

    setState(() {
      getAddressByGeo(_initPosition.latitude.toString(),
              _initPosition.longitude.toString())
          .then((String res) {
        setState(() {
          address = res;
        });
      });
      _isLoading = false;
    });

    return position;
  }

  Future<void> _goToCurrentPos() async {
    var gps = await getCurrentLocation();

    _controller?.animateCamera(
        CameraUpdate.newLatLng(LatLng(gps.latitude, gps.longitude)));
  }
}
