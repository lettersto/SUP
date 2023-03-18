import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/models/review/review.dart';

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

      PaginationQueryParams params = paginationQueryParams;

      if (fetchMore) {
        final paginationState = state as CursorPagination<T>;

        state = CursorPaginationFetchingMore(
            hasNext: paginationState.hasNext, list: paginationState.list);

        params = params.copyWith(
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

      final CursorPagination<T> response;

      if (paginationPathParams.userNo != null) {
        response = await repository.paginate(
          paginationQueryParams: params,
          userNo: paginationPathParams.userNo,
          storeNo: paginationPathParams.storeNo!,
        );
      } else {
        response = await repository.paginate(
          paginationQueryParams: params,
          storeNo: paginationPathParams.storeNo!,
        );
      }

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

  void changeIsLikeState({required int itemIdx, required bool valueToChange}) {
    final isLoading = state is CursorPaginationLoading;

    if (isLoading) return;

    var paginationState = state as CursorPagination<ReviewDetailWithPhotos>;
    if (state is CursorPaginationRefetching) {
      paginationState =
          state as CursorPaginationRefetching<ReviewDetailWithPhotos>;
    }
    if (state is CursorPaginationFetchingMore) {
      paginationState =
          state as CursorPaginationFetchingMore<ReviewDetailWithPhotos>;
    }

    final item = paginationState.list[itemIdx];
    final change = ReviewDetailWithPhotos(
        id: item.id,
        reviewCnt: item.reviewCnt,
        starAvg: item.starAvg,
        isLike: valueToChange,
        nickname: item.nickname,
        regDtm: item.regDtm,
        imgs: item.imgs,
        content: item.content,
        star: item.star,
        tags: item.tags);
    paginationState.list[itemIdx] = change;

    if (state is CursorPagination) {
      state = CursorPagination(
          hasNext: paginationState.hasNext, list: paginationState.list);
    }
    if (state is CursorPaginationRefetching) {
      state = CursorPaginationRefetching(
          hasNext: paginationState.hasNext, list: paginationState.list);
    }
    if (state is CursorPaginationFetchingMore) {
      state = CursorPaginationFetchingMore(
          hasNext: paginationState.hasNext, list: paginationState.list);
    }
  }
}
