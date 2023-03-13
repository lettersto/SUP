import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sup/main.dart';
import 'package:sup/ui/map/bottom_sheet/bottom_sheet_today.dart';
import 'package:sup/utils/geo_network.dart';
import 'package:sup/utils/styles.dart';
import 'dart:io' show Platform;
import '../../models/store.dart';
import '../../utils/strings.dart';
import '../common/tag_filter_item.dart';
import 'bottom_sheet/bottom_sheet_store.dart';

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
  final List<Store> _stores = [
    Store("맘스터치", 37.563063, 126.831237, "4.37", 1218, false),
    Store("산청숯불가든", 37.561036, 126.836975, "3.3", 344, true),
    Store("유나식당", 37.561036, 126.839975, "4.66", 13, false)
  ];
  Store store = Store("", 0.0, 0.0, "", 0, false);
  bool todayVisibility = true;
  bool storeVisibility = false;
  String address = "";

  @override
  void initState() {
    super.initState();
    addCustomIcon();
    getCurrentLocation();
    setState(() {});
  }

  void addCustomIcon() async {
    BitmapDescriptor star = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/icons/marker.png");

    if (Platform.isIOS) {
      star = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), "assets/icons/marker_ios.png");
    }

    for (int i = 0; i < _stores.length; i++) {
      Store s = _stores[i];
      _markers.add(Marker(
          markerId: MarkerId(i.toString()),
          draggable: false,
          icon: star,
          onTap: () => setState(() {
            store = s;
            todayVisibility = false;
            storeVisibility = true;
          }),
          position: LatLng(s.latitude, s.longitude)));
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
            Container(
                margin: const EdgeInsets.only(top: 50, left: 12, right: 12),
                padding: const EdgeInsets.only(left: 18, right: 18),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: GestureDetector(
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        color: Colors.white,
                        height: 50,
                      ),
                      Text("장소, 가게명 검색",
                          style: TextStyles.medium16
                              .merge(TextStyle(color: Colors.grey.shade400))),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(routeSearch);
                  },
                )),
            Container(
              margin: const EdgeInsets.only(left: 9),
              height: 54,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tags.length,
                itemBuilder: (BuildContext context, int position) {
                  return Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: GestureDetector(
                        onTap: () {},
                        child: TagFilterItem(
                          tag: tags[position],
                          shadow: true,
                          background: Colors.white,
                        )),
                  );
                },
              ),
            ),
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
        MapBottomSheet(store, storeVisibility)
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
}