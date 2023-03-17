import 'package:flutter/material.dart';
import 'package:sup/models/common/pagination_params.dart';

import '../providers/providers_exporter.dart';

class PaginationUtils {
  static void paginate({
    required ScrollController controller,
    required PaginationProvider provider,
    required PaginationQueryParams paginationQueryParams,
  }) {
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      provider.paginate(
        fetchMore: true,
        paginationQueryParams: paginationQueryParams,
      );
    }
  }

  static void pullToRefresh({
    required ScrollController controller,
    required PaginationProvider provider,
    required PaginationQueryParams paginationQueryParams,
  }) {
    provider.paginate(
      forceRefetch: true,
      paginationQueryParams: paginationQueryParams,
    );
  }
}
