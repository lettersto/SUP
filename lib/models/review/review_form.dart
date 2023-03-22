import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_form.freezed.dart';

@freezed
class ReviewForm with _$ReviewForm {
  const factory ReviewForm({
    required int storeNo,
    required int userNo,
    required int star,
    required String content,
    required List<int> tags,
    required List<File> imgs,
  }) = _ReviewForm;
}
