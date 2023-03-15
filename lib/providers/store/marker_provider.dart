import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
}
