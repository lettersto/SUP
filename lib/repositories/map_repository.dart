import 'package:dio/dio.dart';

import '../models/map/store.dart';
import '../utils/data_utils.dart';

class TodayRepository {
  late final Dio _dio = Dio(BaseOptions(
    baseUrl: DataUtils.baseUrl!,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    responseType: ResponseType.json,
  ));

  Future<List<dynamic>> fetchToday(MyLatLng userLocation) async {
    //Load json data
    final todayData = await _dio.get('/today', queryParameters: {
      'lat': userLocation.latitude,
      'lng': userLocation.longitude
    });

    print(todayData.data);
    //Decode json to list
    return todayData.data;
  }
}
