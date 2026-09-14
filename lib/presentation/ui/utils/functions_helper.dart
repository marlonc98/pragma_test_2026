import 'dart:async';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FunctionsHelper {
  static Timer? resetSearch({
    required Function() searchFunction,
    required Timer? timer,
    Duration delay = const Duration(milliseconds: 500),
  }) {
    timer?.cancel();
    return Timer(delay, () {
      searchFunction();
    });
  }

  static int? getNextPageKey<T>({
    required PagingState<int, T> state,
    required int itemsPerPage,
  }) {
    if (state.items != null && state.items!.length % itemsPerPage != 0) {
      return null;
    }
    return state.lastPageIsEmpty ? null : state.nextIntPageKey;
  }
}
