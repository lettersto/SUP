import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/providers/review_provider.dart';

import '../models/pagination_state.dart';

// class PaginationNotifier<T> extends StateNotifier<AsyncValue<List<T>>> {
//   final Future<List<T>> Function(T? item) fetchNextItems;
//   final int limit;  // 페이지 당 한 번에 아이템을 몇 개 가져올 건지

//   final List<T> _items = [];

//   PaginationNotifier({
//     required this.fetchNextItems,
//     required this.limit,
//   }) : super(const AsyncValue.loading());

//   void init() {
//     // 맨 처음에 비었다면 할 일
//     if (_items.isEmpty) {
//       fetchInitialItems();
//     }
//   }

//   void updateData(List<T> result) {
//     if (result.isEmpty) {
//       state = AsyncValue.data(_items);
//     } else {
//       state = AsyncValue.data(_items..addAll(result));
//     }
//   }

//   Future<void> fetchInitialItems() async {
//     try {
//       state = const AsyncValue.loading();

//       final List<T> result = _items.isEmpty
//           ? await fetchNextItems(null)
//           : await fetchNextItems(_items.last);
//       updateData(result);
//     } catch (error, stacktrace) {
//       state = AsyncValue.error(error, stacktrace);
//     }
//   }

//   Future<void> fetchNextBatch() async {
//     state = AsyncValue.data(_items);

//     try {
//       final result = await fetchNextItems(_items.last);
//       updateData(result);
//     } catch (error, stacktrace) {
//       state = AsyncValue.error(error, stacktrace);
//     }
//   }
// }

typedef SearchProvider<T, F> = Future<List<T>> Function(
    PaginationNotifier<T, F> controller);

class PaginationNotifier<T, F> extends StateNotifier<PaginationState<T>> {
  final List<T> items = [];
  final SearchProvider<T, F> searchProvider;
  final int batchSize;
  final TextEditingController searchController = TextEditingController();
  final Duration debounceDuration;

  F currentFilter;
  bool hasNoMoreItems = false;
  int page = 1;
  Timer? _timer;
  T? get lastItemOrNull => items.isEmpty ? null : items.last;
  String get query => searchController.text;

  PaginationNotifier({
    required this.searchProvider,
    required this.batchSize,
    required this.currentFilter,
    this.debounceDuration = const Duration(milliseconds: 500),
  }) : super(const PaginationState.data([]));

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 1), () {});
  }

  void updateItems(List<T> results) {
    hasNoMoreItems = results.length < batchSize;

    if (results.isEmpty) {
      state = PaginationState.data(items);
    } else {
      state = PaginationState.data(items..addAll(results));
    }
  }

  Future<void> _performSearch() async {
    List<T> results = await searchProvider(this);
    updateItems(results);
  }

  Future<void> fetchNextBatch({int addToPage = 1}) async {
    if (_timer?.isActive == true) return;

    _startTimer();

    if (hasNoMoreItems) return;
    if (state == PaginationState.onGoingLoading(items)) return;

    state = PaginationState.onGoingLoading(items);

    page += addToPage;

    _performSearch();
  }

  void init() {
    if (items.isEmpty) {
      fetchNextBatch(addToPage: 0);
    }
  }
}
