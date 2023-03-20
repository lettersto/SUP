import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/review/review_form.dart';
import '../../models/review/review_tag.dart';

class ReviewFormNotifier extends AutoDisposeNotifier<ReviewForm> {
  @override
  ReviewForm build() {
    return const ReviewForm(
        storeNo: 0, userNo: 0, star: 0, content: '', tags: [], imgs: []);
  }

  get isImgValidate {
    return state.imgs.isNotEmpty && state.imgs.length <= 10;
  }

  get isTagsValidate {
    return state.tags.isNotEmpty && state.tags.length <= 5;
  }

  get isStarValidate {
    return state.star > 0 && state.star <= 5;
  }

  void setStoreNo(int storeNo) {
    state = state.copyWith(storeNo: storeNo);
  }

  void setUserNo(int userNo) {
    state = state.copyWith(userNo: userNo);
  }

  void setStar(int star) {
    if (star < 0 || star > 5) return;
    state = state.copyWith(star: star);
  }

  void setContent(String content) {
    state = state.copyWith(content: content);
  }

  void setTags(int tag) {
    bool hasTag = state.tags.contains(tag);

    if (hasTag) {
      List<int> tmp = [...state.tags];
      tmp.remove(tag);
      state = state.copyWith(tags: tmp);
      return;
    }

    if (state.tags.length >= 5) {
      return;
    }

    state = state.copyWith(tags: [...state.tags, tag]);
  }

  void setImgs(List<File> imgs) {
    state = state.copyWith(imgs: imgs);
  }

  void resetForm() {
    state = const ReviewForm(
        storeNo: 0, userNo: 0, star: 0, content: '', tags: [], imgs: []);
  }
}

final reviewFormProvider =
    NotifierProvider.autoDispose<ReviewFormNotifier, ReviewForm>(
        ReviewFormNotifier.new);

final reviewTagsProvider = Provider((ref) => ReviewTags.fromJson(tagData));
