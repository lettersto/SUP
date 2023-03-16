import 'package:flutter_dotenv/flutter_dotenv.dart';

class DataUtils {
  static String? baseUrl = dotenv.env['baseUrl'];

  String pathToUrl(String value) {
    return '$baseUrl$value';
  }

  List<String> listPathsToUrls(List paths) {
    // List<String> 이 아니라 List 로 써준 이유는
    // 컴파일러가 List<dynamic> 으로 인식할 것이기 때문
    return paths.map((e) => pathToUrl(e)).toList();
  }
}
