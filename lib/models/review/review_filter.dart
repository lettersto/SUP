import '../../utils/enums.dart';

class ReviewFilters {
  static final reviewFilterTypeList = [
    for (var type in ReviewFilterType.values) type
  ];

  // NOTE Map<String, int>로 되지 않는다.
  static Map<dynamic, dynamic> get reviewFilterTypeMap {
    final typeToIntMap = {};

    for (var idx = 0; idx < reviewFilterTypeList.length; idx++) {
      typeToIntMap[reviewFilterTypeList[idx]] = idx;
    }

    return typeToIntMap;
  }
}
