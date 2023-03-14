import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseUrlProvider = Provider<String>((ref) =>
    'http://ec2-54-180-46-145.ap-northeast-2.compute.amazonaws.com:8080/api');

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  return dio;
});
