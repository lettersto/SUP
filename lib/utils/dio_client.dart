import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  static Dio? _dio;
  final String baseUrl = dotenv.env['baseUrl']!;

  factory DioClient() => DioClient._internal();

  DioClient._internal();

  void init() {
    _dio ??= Dio()..options = BaseOptions(baseUrl: baseUrl);
  }

  Dio? getDio() {
    return _dio;
  }
}
