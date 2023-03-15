import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination_model.g.dart';

abstract class CursorPaginationBase {}

class CursorPaginationLoading extends CursorPaginationBase {}

class CursorPaginationError extends CursorPaginationBase {
  final String message;

  CursorPaginationError({
    required this.message,
  });
}

@JsonSerializable(
  genericArgumentFactories: true,
)
class CursorPagination<T> extends CursorPaginationBase {
  final bool hasNext;
  final List<T> list;

  CursorPagination({
    required this.hasNext,
    required this.list,
  });

  CursorPagination<T> copyWith({
    bool? hasNext,
    List<T>? list,
  }) {
    return CursorPagination(
        hasNext: hasNext ?? this.hasNext, list: list ?? this.list);
  }

  factory CursorPagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CursorPaginationFromJson(json, fromJsonT);
}

class CursorPaginationRefetching<T> extends CursorPagination<T> {
  CursorPaginationRefetching({
    required super.hasNext,
    required super.list,
  });
}

class CursorPaginationFetchingMore<T> extends CursorPagination<T> {
  CursorPaginationFetchingMore({
    required super.hasNext,
    required super.list,
  });
}
