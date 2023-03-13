class PaginatedResponse<T> {
  // final List<T> data;
  // final bool hasNext;
  List<T> data;
  bool hasNext;

  PaginatedResponse({
    this.data = const [],
    this.hasNext = false, // 더 페이지 할 수 있는지 여부
  });

  // temporal method for fake api
  void update(PaginatedResponse<T> res) {
    final _hasNext = res.data.length < 10;
    data = [...data, ...res.data];
    hasNext = _hasNext;
  }
}
