import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sup/providers/store/store_provider.dart';
import 'package:sup/ui/map_result/bottom_sheet/bottom_sheet_result.dart';
import 'package:sup/ui/map_result/appbar_search_bar.dart';
import 'package:sup/utils/geo_network.dart';
import 'package:sup/utils/styles.dart';
import '../../main.dart';
import '../../models/map/store.dart';
import '../map/bottom_sheet/bottom_sheet_store.dart';

class MapResultPage extends ConsumerStatefulWidget {
  const MapResultPage(this.keyword, {super.key});

  final String keyword;

  @override
  ConsumerState<MapResultPage> createState() => MapResultPageState();
}

class MapResultPageState extends ConsumerState<MapResultPage> {
  final Completer<GoogleMapController> _controller = Completer();

  late LatLng _initPosition;
  bool _isLoading = true;
  List<Marker> _markers = [];
  Store store = Store.init();
  bool resultVisibility = true;
  bool storeVisibility = false;
  String address = "";

  @override
  void initState() {
    super.initState();
    //addCustomIcon();
    getCurrentLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Store> stores = ref.watch(storeProvider).list;

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
        flexibleSpace: ResultSearchBar(widget.keyword),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(routeMap);
              },
              icon: const Icon(
                Icons.close_sharp,
                color: Colors.grey,
              ))
        ],
      ),
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
                          resultVisibility = true;
                        }),
                      )),
          ],
        ),
        Column(
          children: [
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
                  : ResultBottomSheet(scrollController, resultVisibility));
            }),
        MapBottomSheet(store.storeNo, storeVisibility)
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
