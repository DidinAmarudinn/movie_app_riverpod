import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/core/pagnation_state.dart';
import 'package:movie_app_riverpod/src/core/request_state.dart';
import 'package:movie_app_riverpod/src/core/shared_notifier/pagnation_notifier.dart';
import 'package:movie_app_riverpod/src/exceptions/api_error.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movie_repository.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/list_genres.dart';
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
        return ref.read(movieRepositoryProvider).getSimmiliarsMovie(id, page);
      },
      itemsPerBatch: 20)
    ..init();
});

final itemsMovieByGenreProvider = StateNotifierProvider.family<
    PaginationNotifier<Movie>, PagnationState<Movie>, int>((ref, int genreId) {
  return PaginationNotifier(
      fetchNextItems: (page) {
        return ref.read(movieRepositoryProvider).getMoviesByGenres(genreId, page);
      },
      itemsPerBatch: 20)
    ..init();
});

final itemsTrendingProvider =
    StateNotifierProvider<PaginationNotifier<Movie>, PagnationState<Movie>>(
        (ref) {
  return PaginationNotifier(
      fetchNextItems: (page) {
        log(page.toString());
        return ref.read(movieRepositoryProvider).getTrandingMovie();
      },
      itemsPerBatch: 20)
    ..init();
});

class MovieGenresNotifier extends StateNotifier<RequestState<ListGenres>> {
  final MovieRepository repository;
  MovieGenresNotifier(this.repository) : super(const RequestState.initial());

  Future<void> getMovieGenres() async {
    log("message");
    state = const RequestState.loading();
    final result = await repository.getMovieGenres();
    result.fold((l) {
      state = RequestState.error(l.stringError());
    }, (r) {
      state = RequestState.success(r);
    });
  }
}

final movieGenresProvider =
    StateNotifierProvider<MovieGenresNotifier, RequestState<ListGenres>>((ref) {
  return MovieGenresNotifier(ref.watch(movieRepositoryProvider))
    ..getMovieGenres();
});
