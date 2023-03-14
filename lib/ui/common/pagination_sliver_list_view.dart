import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common/cursor_pagination_model.dart';
import '../../models/common/model_with_id.dart';
import '../../providers/common/pagination_provider.dart';

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

    if (state is CursorPaginationLoading) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state is CursorPaginationError) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(
            state.message,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final cp = state as CursorPagination<T>;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, itemIdx) {
          if (itemIdx == cp.list.length) {
            return Center(
              child: cp is CursorPaginationFetchingMore
                  ? const CircularProgressIndicator()
                  : const Text('마지막 데이터'),
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
