import '../../models/common/cursor_pagination_model.dart';
import '../../models/common/model_with_id.dart';
import '../../models/common/pagination_params.dart';

abstract class IBasePaginationRepository<T extends IModelWithId> {
  Future<CursorPagination<T>> paginate({
    PaginationQueryParams? paginationQueryParams =
        const PaginationQueryParams(),
    required int storeNo,
    int? userNo,
  });
}
