import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/map/map.dart';
import '../../models/map/store.dart';
import '../../models/wish/wish.dart';
import '../../providers/store/store_detail_provider.dart';
import '../../providers/store/store_provider.dart';
import '../../providers/wish/wish_provider.dart';
import '../../utils/geo_network.dart';
import '../../utils/sharedPreference_util.dart';
import '../../utils/styles.dart';
import '../map/bottom_sheet/bottom_sheet_store.dart';
import '../map/map_page.dart';
import 'appbar_search_bar.dart';
import 'bottom_sheet/bottom_sheet_result.dart';

int selectedStoreNo = 0;

class MapResultPage extends ConsumerStatefulWidget {
  const MapResultPage(this.keyword, this.categoryNo, {super.key});

  final String keyword;
  final int categoryNo;

  @override
  ConsumerState<MapResultPage> createState() => MapResultPageState();
}

class MapResultPageState extends ConsumerState<MapResultPage> {
  GoogleMapController? _controller;

  late LatLng _initPosition;
  bool _isLoading = true;
  Set<Marker> storeMarkers = {};
  Set<Marker> wishMarkers = {};

  bool resultVisibility = true;
  bool storeVisibility = false;
  String address = "";
  List<Store> stores = [];

  var headerHeight = 1.0;
  var itemHeight = 1.0;

  @override
  void initState() {
    selectedStoreNo = 0;
    super.initState();
    fetchStoreResult();
  }

  @override
  Widget build(BuildContext context) {
    stores = ref.watch(storeProvider).list;
    List<Wish> wishes = ref.watch(wishProvider).list;

    addStoreMarker(stores);
    addWishMarker(wishes);
    storeMarkers.addAll(wishMarkers);

    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final windowHeight =
        MediaQuery.of(context).size.height - 60 - statusBarHeight;
    final headerHeight = 100 / windowHeight;

    itemHeightSetter(_itemHeight) {
      setState(() {
        itemHeight = _itemHeight / windowHeight;
      });
    }

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
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const MapPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              icon: const Icon(
                Icons.close_sharp,
                color: Colors.grey,
              ))
        ],
      ),
      extendBodyBehindAppBar: false,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(fit: StackFit.expand, children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: GoogleMap(
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
                    markers: storeMarkers,
                    onTap: (LatLng) => setState(() {
                      selectedStoreNo = 0;
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
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Visibility(
                    visible: stores.isEmpty,
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, -0.05),
                                blurRadius: 0.7,
                                spreadRadius: 0.7,
                                color: Colors.grey.withOpacity(0.7))
                          ],
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          "일치하는 음식점이 없어요 🤔",
                          style: TextStyles.regular14,
                        ),
                      ),
                    ),
                  )),
              Visibility(
                visible: resultVisibility,
                child: DraggableScrollableSheet(
                    initialChildSize: stores.isEmpty ? 0 : 0.35,
                    minChildSize: stores.isEmpty ? 0 : 0.35,
                    maxChildSize:
                        min(itemHeight * stores.length + headerHeight, 1),
                    expand: false,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return (_isLoading
                          ? Container()
                          : ResultBottomSheet(
                              scrollController,
                              resultVisibility,
                              widget.categoryNo,
                              widget.keyword,
                              itemHeightSetter));
                    }),
              ),
              Visibility(
                visible: storeVisibility,
                child: MapBottomSheet(storeVisibility),
              ),
            ]),
    );
  }

  void addWishMarker(List<Wish> wishes) {
    wishMarkers.clear();

    for (int i = 0; i < wishes.length; i++) {
      Wish s = wishes[i];
      bool isExist = false;

      for (Marker m in storeMarkers) {
        if (m.markerId.value == s.storeNo.toString()) {
          isExist = true;
          break;
        }
      }

      if (!isExist) {
        wishMarkers.add(Marker(
            markerId: MarkerId(s.storeNo.toString()),
            draggable: false,
            icon: selectedStoreNo == s.storeNo ? selectedImg! : wishImg!,
            onTap: () => setState(() {
                  selectedStoreNo = s.storeNo;
                  ref
                      .read(storeDetailProvider.notifier)
                      .getStoreDetail(s.storeNo, SharedPreferenceUtil().userNo);
                  showStoreDetailBottomSheet();
                }),
            position: LatLng(s.lat, s.lng)));
      }
    }
  }

  void showStoreDetailBottomSheet() {
    storeVisibility = true;
    resultVisibility = false;
  }

  void showResultBottomSheet() {
    storeVisibility = false;
    resultVisibility = true;
  }

  void addStoreMarker(List<Store> stores) {
    storeMarkers.clear();

    for (int i = 0; i < stores.length; i++) {
      Store s = stores[i];
      storeMarkers.add(Marker(
          markerId: MarkerId(s.storeNo.toString()),
          draggable: false,
          icon: selectedStoreNo == s.storeNo ? selectedImg! : starImg!,
          onTap: () => setState(() {
                selectedStoreNo = s.storeNo;

                ref
                    .read(storeDetailProvider.notifier)
                    .getStoreDetail(s.storeNo, SharedPreferenceUtil().userNo);

                resultVisibility = false;
                storeVisibility = true;
              }),
          position: LatLng(s.lat, s.lng)));
    }
  }

  void deleteWishMarker(int storeNo) {
    setState(() {
      Marker marker = storeMarkers
          .firstWhere((marker) => marker.markerId.value == storeNo.toString());
      storeMarkers.remove(marker);
    });
  }

  Future<Position> fetchStoreResult() async {
    await ref.read(storeProvider.notifier).getStoreList(userLocation.latitude,
        userLocation.longitude, 0, widget.categoryNo, "", "STAR");

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
    var gps = await fetchStoreResult();

    _controller?.animateCamera(
        CameraUpdate.newLatLng(LatLng(gps.latitude, gps.longitude)));
  }
}
