import 'package:flutter/material.dart';

import '../providers/providers_exporter.dart';

class PaginationUtils {
  static void paginate({
    required ScrollController controller,
    required PaginationProvider provider,
  }) {
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      provider.paginate(
        fetchMore: true,
      );
    }
  }

  static void pullToRefresh({
    required ScrollController controller,
    required PaginationProvider provider,
  }) {
    provider.paginate(
      forceRefetch: true,
    );
  }
}
