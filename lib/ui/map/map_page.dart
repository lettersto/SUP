import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sup/ui/map/bottom_sheet/bottom_sheet_today.dart';
import 'package:sup/ui/map/tag_map.dart';
import 'package:sup/utils/geo_network.dart';
import 'package:sup/utils/styles.dart';
import 'dart:io' show Platform;
import '../../main.dart';
import '../../models/store.dart';
import 'bottom_sheet/bottom_sheet_store.dart';
import 'map_search_bar.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  late LatLng _initPosition;
  bool _isLoading = true;
  List<Marker> _markers = [];
  late String user;

  final List<LikeStore> likes = [
    LikeStore(1, Location(37.563063, 126.831237)),
    LikeStore(2, Location(37.561036, 126.836975)),
    LikeStore(3, Location(37.561036, 126.839975)),
  ];

  int storeNo = 1;
  bool todayVisibility = true;
  bool storeVisibility = false;
  String address = "";

  @override
  void initState() {
    super.initState();
    getUserName();
    addCustomIcon();
    getCurrentLocation();
    setState(() {});
  }

  void addCustomIcon() async {
    BitmapDescriptor star = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/icons/marker.png");

    if (Platform.isIOS) {
      star = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), "assets/icons/marker_ios.png");
    }

    for (int i = 0; i < likes.length; i++) {
      LikeStore s = likes[i];
      _markers.add(Marker(
          markerId: MarkerId(i.toString()),
          draggable: false,
          icon: star,
          onTap: () => setState(() {
                storeNo = s.storeNo;
                todayVisibility = false;
                storeVisibility = true;
              }),
          position: LatLng(s.location.latitude, s.location.longitude)));
    }
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
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                              _initPosition.latitude, _initPosition.longitude),
                          zoom: 14.4746,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
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
        MapBottomSheet(storeNo, storeVisibility)
      ]),
    );
  }

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _initPosition = LatLng(position.latitude, position.longitude);
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

  void getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    user = prefs.getString('nickname')!;
  }
}
