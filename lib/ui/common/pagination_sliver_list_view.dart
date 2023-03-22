import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common/cursor_pagination_model.dart';
import '../../models/common/model_with_id.dart';
import '../../providers/common/pagination_provider.dart';
import '../review/review_list/review_list_item_skeleton.dart';
import '../review/common/no_content_indicator.dart';

typedef PaginationWidgetBuilder<T extends IModelWithId> = Widget Function(
  BuildContext context,
  int index,
  T model,
);

class PaginationSliverListView<T extends IModelWithId>
    extends ConsumerStatefulWidget {
  final StateNotifierProvider<PaginationProvider, CursorPaginationBase>
      provider;
  final PaginationWidgetBuilder itemBuilder;

  const PaginationSliverListView({
    super.key,
    required this.provider,
    required this.itemBuilder,
  });

  @override
  ConsumerState<PaginationSliverListView> createState() =>
      _PaginationSliverListViewState<T>();
}

class _PaginationSliverListViewState<T extends IModelWithId>
    extends ConsumerState<PaginationSliverListView> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.provider);
    const pad = EdgeInsets.fromLTRB(16, 0, 16, 40);

    if (state is CursorPaginationLoading) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: pad,
          child: ReviewListItemSkeleton(),
        ),
      );
    }

    if (state is CursorPaginationError) {
      return const SliverToBoxAdapter(
          child: Padding(
        padding: pad,
        child: NoContentIndicator(
            height: 200, message: '리뷰가 없어요! 😭 \n 리뷰를 작성해 보세요!'),
      ));
    }

    final cp = state as CursorPagination<T>;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, itemIdx) {
          if (itemIdx == cp.list.length) {
            return Center(
              child: cp is CursorPaginationFetchingMore
                  ? const ReviewListItemSkeleton()
                  : const SizedBox(
                      height: 32,
                    ),
            );
          }

          final items = cp.list[itemIdx];

          return widget.itemBuilder(
            context,
            itemIdx,
            items,
          );
        },
        childCount: cp.list.length,
      ),
    );
  }
}
