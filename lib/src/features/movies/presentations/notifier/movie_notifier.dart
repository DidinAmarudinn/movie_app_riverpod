import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/core/pagnation_state.dart';
import 'package:movie_app_riverpod/src/core/shared_notifier/pagnation_notifier.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movie_repository.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/movie.dart';

final itemsPopularMovieProvider =
    StateNotifierProvider<PaginationNotifier<Movie>, PagnationState<Movie>>(
        (ref) {
  return PaginationNotifier(
      fetchNextItems: (page) {
        return ref.read(movieRepositoryProvider).getListPopularMovie(page);
      },
      itemsPerBatch: 20)
    ..init();
});
final itemsUpcomingMovieProvider =
    StateNotifierProvider<PaginationNotifier<Movie>, PagnationState<Movie>>(
        (ref) {
  return PaginationNotifier(
      fetchNextItems: (page) {
        return ref.read(movieRepositoryProvider).getListUpComing(page);
      },
      itemsPerBatch: 20)
    ..init();
});
final itemsTopRatedMovieProvider =
    StateNotifierProvider<PaginationNotifier<Movie>, PagnationState<Movie>>(
        (ref) {
  return PaginationNotifier(
      fetchNextItems: (page) {
        return ref.read(movieRepositoryProvider).getListTopRatedMovie(page);
      },
      itemsPerBatch: 20)
    ..init();
});
final itemsLatestMovieProvider =
    StateNotifierProvider<PaginationNotifier<Movie>, PagnationState<Movie>>(
        (ref) {
  return PaginationNotifier(
      fetchNextItems: (page) {
        return ref.read(movieRepositoryProvider).getListLatestMovie(page);
      },
      itemsPerBatch: 20)
    ..init();
});
final itemsNowPlayingMovieProvider =
    StateNotifierProvider<PaginationNotifier<Movie>, PagnationState<Movie>>(
        (ref) {
  return PaginationNotifier(
      fetchNextItems: (page) {
        return ref.read(movieRepositoryProvider).getListNowPlayingMovie(page);
      },
      itemsPerBatch: 20)
    ..init();
});

final itemsSimmiliarsMovieProvider = StateNotifierProvider.family<
    PaginationNotifier<Movie>, PagnationState<Movie>, int>((ref, int id) {
  return PaginationNotifier(
      fetchNextItems: (page) {
        log(page.toString());
        return ref.read(movieRepositoryProvider).getSimmiliarsMovie(id, page);
      },
      itemsPerBatch: 20)
    ..init();
});
