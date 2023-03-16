import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final baseUrl = dotenv.env['baseUrl']!;

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio()..options = BaseOptions(baseUrl: baseUrl);
  dio.interceptors.add(PrettyDioLogger());

  return dio;
});
