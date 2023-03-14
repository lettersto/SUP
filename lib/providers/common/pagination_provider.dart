import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common/cursor_pagination_model.dart';
import '../../models/common/model_with_id.dart';
import '../../models/common/pagination_params.dart';
import '../../repositories/common/base_pagination_repository.dart';

class PaginationProvider<T extends IModelWithId,
        U extends IBasePaginationRepository<T>>
    extends StateNotifier<CursorPaginationBase> {
  final U repository;

  PaginationProvider({
    required this.repository,
  }) : super(CursorPaginationLoading()) {
    paginate();
  }

  Future<void> paginate({
    int size = 10,
    bool fetchMore = false,
    bool forceRefetch = false,
  }) async {
    try {
      if (state is CursorPagination && !forceRefetch) {
        final paginationState = state as CursorPagination;

        if (!paginationState.hasNext) {
          return;
        }
      }

      final isLoading = state is CursorPaginationLoading;
      final isRefetching = state is CursorPaginationRefetching;
      final isFetchingMore = state is CursorPaginationFetchingMore;

      if (fetchMore && (isLoading || isRefetching || isFetchingMore)) {
        return;
      }

      PaginationParams paginationParams = PaginationParams(size: size);

      if (fetchMore) {
        final paginationState = state as CursorPagination<T>;

        state = CursorPaginationFetchingMore(
            hasNext: paginationState.hasNext, list: paginationState.list);

        paginationParams = paginationParams.copyWith(
          lastNo: paginationState.list.last.id,
        );
      } else {
        if (state is CursorPagination && !forceRefetch) {
          final paginationState = state as CursorPagination<T>;

          state = CursorPaginationRefetching(
              hasNext: paginationState.hasNext, list: paginationState.list);
        } else {
          state = CursorPaginationLoading();
        }
      }

      final response = await repository.paginate(
        paginationParams: paginationParams,
      );

      if (state is CursorPaginationFetchingMore) {
        final paginationState = state as CursorPaginationFetchingMore<T>;

        state = response.copyWith(list: [
          ...paginationState.list,
          ...response.list,
        ]);

        print(state);
      } else {
        state = response;
      }
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      state = CursorPaginationError(message: '데이터를 가져오지 못했습니다.');
    }
  }
}
