import 'dart:convert';
import 'dart:developer';

import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sup/utils/styles.dart';

Future<String> getAddressByGeo(String latitude, String longitude) async {
  String? googleApiKey = dotenv.env['geoApiKey'];
  String geoAPI =
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$googleApiKey&language=ko';

  GeoNetwork geoNetwork = GeoNetwork(geoAPI);

  var doroData = await geoNetwork.getDoro();
  var si = doroData['results'][0]['address_components'][2]['short_name'];
  var addr = doroData['results'][0]['address_components'][1]['short_name'];

  return si + " " + addr;
}

class GeoNetwork {
  final String url;

  GeoNetwork(this.url);

  Future<dynamic> getDoro() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);

      return parsingData;
    }
  }
}
