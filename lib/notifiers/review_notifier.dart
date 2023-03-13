import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewFilterNotifier extends Notifier<int> {
  @override
  int build() {
    return -1;
  }

  void selectFilter(int filterIndex) {
    state = filterIndex;
  }

  void resetFilter() {
    state = -1;
  }
}
