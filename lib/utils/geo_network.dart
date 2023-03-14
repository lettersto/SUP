import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String> getAddressByGeo(String latitude, String longitude) async {
  String? googleApiKey = dotenv.env['geoApiKey'];
  String geoAPI =
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$googleApiKey&language=ko';

  GeoNetwork geoNetwork = GeoNetwork(geoAPI);

  var addrData = await geoNetwork.getAddr();
  var gu = addrData['results'][0]['address_components'][2]['short_name'];
  var dong = addrData['results'][0]['address_components'][1]['short_name'];

  return gu + " " + dong;
}

class GeoNetwork {
  final String url;

  GeoNetwork(this.url);

  Future<dynamic> getAddr() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);

      return parsingData;
    }
  }
}
