import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseUrl = dotenv.env['baseUrl']!;

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio()..options = BaseOptions(baseUrl: baseUrl);
  return dio;
});
