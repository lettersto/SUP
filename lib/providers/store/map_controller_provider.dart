import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final mapControllerProvider =
    StateNotifierProvider<MapControllerNotifier, GoogleMapController?>((ref) {
  return MapControllerNotifier();
});

class MapControllerNotifier extends StateNotifier<GoogleMapController?> {
  MapControllerNotifier() : super(null);

  void setController(GoogleMapController controller) {
    state = controller;
  }
}
