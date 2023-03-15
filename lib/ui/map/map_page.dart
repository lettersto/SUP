import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sup/providers/store/marker_provider.dart';
import 'package:sup/providers/store/store_provider.dart';
import 'package:sup/ui/map/bottom_sheet/bottom_sheet_today.dart';
import 'package:sup/ui/map/tag_map.dart';
import 'package:sup/utils/app_utils.dart';
import 'package:sup/utils/geo_network.dart';
import 'package:sup/utils/sharedPreference_util.dart';
import 'package:sup/utils/styles.dart';
import 'dart:io' show Platform;
import '../../models/map/map.dart';
import '../../models/map/store.dart';
import '../../providers/store/map_controller_provider.dart';
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
  late MyLatLng userLocation;
  bool _isLoading = true;

  final List<LikeStore> likes = [
    LikeStore(1, MyLatLng(37.563063, 126.831237)),
    LikeStore(2, MyLatLng(37.561036, 126.836975)),
    LikeStore(3, MyLatLng(37.561036, 126.839975)),
  ];

  int storeNo = 0;
  bool todayVisibility = true;
  bool storeVisibility = false;
  String address = "";
  List<Marker> _markers = [];
  List<Store> stores = [];

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onMapCreated(GoogleMapController controller) async {
      stores = ref.read(storeProvider).list;
      ref.read(mapControllerProvider.notifier).setController(controller);
      addCustomIcon(stores);
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
                        markers: Set.from(_markers),
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
            TagMapList(userLocation),
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
                  : TodayBottomSheet(scrollController, todayVisibility, address,
                      userLocation));
            }),
        MapBottomSheet(storeVisibility)
      ]),
    );
  }

  void addCustomIcon(List<Store> stores) async {
    BitmapDescriptor star = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/icons/marker_store.png");

    if (Platform.isIOS) {
      star = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), "assets/icons/marker_store.png");
    }

    for (int i = 0; i < stores.length; i++) {
      Store s = stores[i];
      _markers.add(Marker(
          markerId: MarkerId(s.storeNo.toString()),
          draggable: false,
          icon: star,
          onTap: () => setState(() {
                storeNo = s.storeNo;
                showToast(storeNo.toString());
                todayVisibility = false;
                storeVisibility = true;
              }),
          position: LatLng(s.lat, s.lng)));
    }
  }

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _initPosition = LatLng(position.latitude, position.longitude);
      userLocation = MyLatLng(position.latitude, position.longitude);
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
