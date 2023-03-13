import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/paginated_response.dart';
import '../models/review.dart';

class ReviewRepository {
  static const endpoint = 'https://jsonplaceholder.typicode.com/comments';

  Future<PaginatedResponse<Review>> getReviews([int page = 1]) async {
    http.Response response =
        await http.get(Uri.parse('$endpoint?_page=$page&_limit=10'));
    final result = jsonDecode(response.body);
    return PaginatedResponse(
      hasNext: result.length > 0 ? true : false,
      data: result.map<Review>((r) => Review.fromJson(r)).toList(),
    );
  }
}
