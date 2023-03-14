import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/dummy/dummy.dart';

class DummyApi {
  String userImageUrl = 'https://reqres.in/api/users?page=1';

  Future<List<ImageReview>> getImageReviews() async {
    http.Response response = await http.get(Uri.parse(userImageUrl));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    final List result = jsonDecode(response.body)['data'];
    return result.map((e) => ImageReview.fromJson(e)).toList();
  }
}
