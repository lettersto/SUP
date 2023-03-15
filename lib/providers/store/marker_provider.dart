import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sup/ui/map/map_page.dart';

import '../../models/map/store.dart';
import '../../repositories/store/store_repository.dart';
import 'map_controller_provider.dart';

final markerProvider =
    StateNotifierProvider<MarkersNotifier, Set<Marker>>((ref) {
  final repository = ref.watch(
    storeRepositoryProvider,
  );
  final GoogleMapController? controller = ref.watch(mapControllerProvider);

  return MarkersNotifier(repository: repository, controller: controller);
});

class MarkersNotifier extends StateNotifier<Set<Marker>> {
  final StoreRepository repository;
  final GoogleMapController? controller;

  MarkersNotifier({
    required this.repository,
    required this.controller,
  }) : super({});

  void addCustomIcon(List<Store> stores) async {
    Set<Marker> markers = {};

    BitmapDescriptor star = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/icons/marker.png");

    if (Platform.isIOS) {
      star = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), "assets/icons/marker_ios.png");
    }

    for (int i = 0; i < stores.length; i++) {
      Store s = stores[i];
      markers.add(Marker(
          markerId: MarkerId(i.toString()),
          draggable: false,
          icon: star,
          onTap: () => MapPageState().setMapPage(s.storeNo),
          position: LatLng(s.lat, s.lng)));
    }

    state = markers;
  }

  void onTap({
    required int id,
    required double lat,
    required double lng,
  }) async {
    if (controller != null) {
      final mapController = controller as GoogleMapController;
      final zoom = (await mapController.getZoomLevel()).toInt();

      if (zoom == 10) {
        zoomToNewPosition(11, mapController, lat, lng);
      } else if (zoom <= 12) {
        zoomToNewPosition(13, mapController, lat, lng);
      } else if (zoom <= 14) {
        zoomToNewPosition(15, mapController, lat, lng);
      } else {
        // 아파트
      }
    }
  }

  void zoomToNewPosition(
      int zoom, GoogleMapController mapController, double lat, double lng) {
    mapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: zoom.toDouble(),
        ),
      ),
    );
  }
}
