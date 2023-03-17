import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sup/models/map/today_pick.dart';
import 'package:sup/models/wish/wish.dart';
import 'package:sup/providers/wish/wish_provider.dart';
import 'package:sup/ui/map/bottom_sheet/bottom_sheet_today.dart';
import 'package:sup/ui/map/tag_map.dart';
import 'package:sup/utils/geo_network.dart';
import 'package:sup/utils/sharedPreference_util.dart';
import 'package:sup/utils/styles.dart';
import 'dart:io' show Platform;
import '../../models/map/map.dart';
import '../../models/map/store.dart';
import '../../providers/store/map_controller_provider.dart';
import '../../providers/store/store_detail_provider.dart';
import 'bottom_sheet/bottom_sheet_store.dart';
import 'map_search_bar.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => MapPageState();
}

class MapPageState extends ConsumerState<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  late LatLng _initPosition;
  bool _isLoading = true;
  bool todayVisibility = true;
  bool storeVisibility = false;
  String address = "";

  @override
  void initState() {
    getCurrentLocation();
    ref.read(wishProvider.notifier).getWishList(SharedPreferenceUtil().userNo);
    super.initState();
    setState(() {});
  }

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    List<Wish> wishes = ref.watch(wishProvider).list;

    Future<void> onMapCreated(GoogleMapController controller) async {
      addWishMarker(wishes);
    }

    return Scaffold(
      extendBodyBehindAppBar: false,
      body: Stack(fit: StackFit.expand, children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                              _initPosition.latitude, _initPosition.longitude),
                          zoom: 14.4746,
                        ),
                        onMapCreated: onMapCreated,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        mapToolbarEnabled: false,
                        markers: markers,
                        onTap: (LatLng) => setState(() {
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

  void addWishMarker(List<Wish> wishes) async {
    BitmapDescriptor star = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/icons/marker.png");

    if (Platform.isIOS) {
      star = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), "assets/icons/marker_ios.png");
    }

    for (int i = 0; i < wishes.length; i++) {
      Wish s = wishes[i];

      markers.add(Marker(
          markerId: MarkerId(s.storeNo.toString()),
          draggable: false,
          icon: star,
          onTap: () => setState(() {
                ref
                    .read(storeDetailProvider.notifier)
                    .getStoreDetail(s.storeNo, SharedPreferenceUtil().userNo);

                todayVisibility = false;
                storeVisibility = true;
              }),
          position: LatLng(s.lat, s.lng)));
    }

    setState(() {});
  }

  void addSingleWish(int storeNo, double lat, double lng) async {
    BitmapDescriptor star = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/icons/marker.png");

    if (Platform.isIOS) {
      star = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), "assets/icons/marker_ios.png");
    }

    markers.add(Marker(
        markerId: MarkerId(storeNo.toString()),
        draggable: false,
        icon: star,
        onTap: () => setState(() {
              ref
                  .read(storeDetailProvider.notifier)
                  .getStoreDetail(storeNo, SharedPreferenceUtil().userNo);

              todayVisibility = false;
              storeVisibility = true;
            }),
        position: LatLng(lat, lng)));
  }

  void deleteMarker(int storeNo) {
    Marker marker = markers
        .firstWhere((marker) => marker.markerId.value == storeNo.toString());
    markers.remove(marker);
    setState(() {});
  }

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _initPosition = LatLng(position.latitude, position.longitude);
      userLocation = MyLatLng(_initPosition.latitude, _initPosition.longitude);

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
    final GoogleMapController controller = await _controller.future;
    var gps = await getCurrentLocation();

    controller.animateCamera(
        CameraUpdate.newLatLng(LatLng(gps.latitude, gps.longitude)));
  }
}
