import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/exceptions/api_error.dart';
import '../pagnation_state.dart';

class PaginationNotifier<T> extends StateNotifier<PagnationState<T>> {
  PaginationNotifier({
    required this.fetchNextItems,
    required this.itemsPerBatch,
  }) : super(const PagnationState.loading());

  final Future<Either<APIError, List<T>>> Function(int page) fetchNextItems;
  final int itemsPerBatch;

  final List<T> _items = [];

  Timer _timer = Timer(const Duration(milliseconds: 0), () {});

  bool noMoreItems = false;
  int page = 1;
  void init() {
    if (_items.isEmpty) {
      fetchFirstBatch();
    }
  }

  void updateData(List<T> result) {
    noMoreItems = result.length < itemsPerBatch;

    if (result.isEmpty) {
      state = PagnationState.data(_items);
    } else {
      state = PagnationState.data(_items..addAll(result));
    }
    page++;
  }

  Future<void> fetchFirstBatch() async {
    try {
      state = const PagnationState.loading();
      final result = await fetchNextItems(page);
      result.fold((l) {
        state = PagnationState.error(l.stringError());
      }, (list) {
        final List<T> result = list;
        updateData(result);
      });
    } catch (e) {
      state = PagnationState.error(e.toString());
    }
  }

  Future<void> fetchNextBatch() async {
    if (_timer.isActive && _items.isNotEmpty) {
      return;
    }
    _timer = Timer(const Duration(milliseconds: 1000), () {});

    if (noMoreItems) {
      return;
    }

    if (state == PagnationState<T>.onGoingLoading(_items)) {
      return;
    }

    state = PagnationState.onGoingLoading(_items);

    await Future.delayed(const Duration(seconds: 1));
    final result = await fetchNextItems(page);
    result.fold((l) {
      state = PagnationState.onGoingError(_items, l.stringError());
    }, (list) {
      updateData(list);
    });
  }
}
