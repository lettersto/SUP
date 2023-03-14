import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

import '../models/network/result.dart';

typedef EntityMapper<Entity, Model> = Model Function(Entity entity);

abstract class BaseRepository {
  final String endpoint = dotenv.env['baseUrl']!;

  Dio get dio => Dio();
}
