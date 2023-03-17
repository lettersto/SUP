import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common/cursor_pagination_model.dart';
import '../../models/common/model_with_id.dart';
import '../../models/common/pagination_params.dart';
import '../../repositories/common/base_pagination_repository.dart';

class PaginationProvider<T extends IModelWithId,
        U extends IBasePaginationRepository<T>>
    extends StateNotifier<CursorPaginationBase> {
  final U repository;
  final PaginationPathParams paginationPathParams;
  final PaginationQueryParams paginationQueryParams;

  PaginationProvider({
    required this.repository,
    required this.paginationPathParams,
    required this.paginationQueryParams,
  }) : super(CursorPaginationLoading()) {
    paginate(paginationQueryParams: paginationQueryParams);
  }

  Future<void> paginate({
    int size = 10,
    bool fetchMore = false,
    bool forceRefetch = false,
    required PaginationQueryParams paginationQueryParams,
  }) async {
    try {
      // 1. retune하는 경우1
      // scroll 하단에 도달한 경우인데 값이 없다면 리턴
      if (state is CursorPagination && !forceRefetch) {
        final paginationState = state as CursorPagination;

        if (!paginationState.hasNext) {
          return;
        }
      }

      // 2. return하는 경우 2
      // 이미 갖고 오고 있는 중이라면 리턴
      final isLoading = state is CursorPaginationLoading;
      final isRefetching = state is CursorPaginationRefetching;
      final isFetchingMore = state is CursorPaginationFetchingMore;

      if (fetchMore && (isLoading || isRefetching || isFetchingMore)) {
        return;
      }

      // 3. 실제로 값 가져오기 위한 준비 시작
      // query parameter를 변형할 거니 변수에 할당 (item의 next number)
      PaginationQueryParams params = paginationQueryParams;

      // 3-1. 스크롤 하단에 도달한 경우
      if (fetchMore) {
        final paginationState = state as CursorPagination<T>;

        state = CursorPaginationFetchingMore(
            hasNext: paginationState.hasNext, list: paginationState.list);

        params = params.copyWith(
          lastNo: paginationState.list.last.id,
        );
        // 3-2. 데이터를 처음부터 가져오는 상황
        // 그동안 데이터는 보여야 하니 나중에 바꾸더라도 일단 보존
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
        paginationQueryParams: params,
        userNo: paginationPathParams.userNo!,
        storeNo: paginationPathParams.storeNo!,
      );

      if (state is CursorPaginationFetchingMore) {
        final paginationState = state as CursorPaginationFetchingMore<T>;

        state = response.copyWith(list: [
          ...paginationState.list,
          ...response.list,
        ]);
      } else {
        state = response;
      }
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      state = CursorPaginationError(message: '연결을 다시 시도해주세요.');
    }
  }
}
