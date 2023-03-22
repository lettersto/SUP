import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/models/review/review_tag.dart';

import '../../models/review/review_tag_filter.dart';
import '../../utils/enums.dart';

class ReviewFilterImageOnlyNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

class ReviewFilterStarRegDtmNotifier
    extends Notifier<ReviewFilterStarRegDtmType> {
  @override
  ReviewFilterStarRegDtmType build() {
    return ReviewFilterStarRegDtmType.STAR;
  }

  void setType(ReviewFilterStarRegDtmType type) {
    state = type;
  }
}

class ReviewTagFilterNotifier extends Notifier<ReviewTagFilter> {
  final tags = tagData;

  @override
  ReviewTagFilter build() {
    return ReviewTagFilter(
        tagLength: tags.length,
        selected: -1, // 실제 selected
        selectedState: List.generate(tags.length, (index) => false));
  }

  void selectFilter(int selectedIndex) {
    var newIsSelected = List.generate(tags.length, (index) => false);
    if (state.selected == selectedIndex) {
      state = state.copyWith(selected: -1, selectedState: newIsSelected);
      return;
    }
    newIsSelected[selectedIndex] = true;
    state =
        state.copyWith(selected: selectedIndex, selectedState: newIsSelected);
  }

  List<bool> get getSelectedState {
    return state.selectedState;
  }

  bool isSelected(int selectedIdx) {
    return selectedIdx == state.selected;
  }
}

class ReviewSearchKeywordNotifier extends AutoDisposeNotifier<String> {
  @override
  String build() {
    return '';
  }

  void setKeyword(String newWord) {
    state = newWord;
  }
}
