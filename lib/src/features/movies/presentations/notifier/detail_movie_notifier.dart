import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/core/request_state.dart';
import 'package:movie_app_riverpod/src/exceptions/api_error.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movie_repository.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/detail_movie.dart';

import '../../domain/entities/list_trailer.dart';

class DetailMovieNotifier extends StateNotifier<RequestState<DetailMovie?>> {
  final int id;
  final MovieRepository repository;

  DetailMovieNotifier(this.id, this.repository)
      : super(const RequestState.initial());
  Future<void> getDetailMovie() async {
    state = const RequestState.loading();
    final result = await repository.getDetailMovie(id);
    result.fold((l) {
      state = RequestState.error(l.stringError());
    }, (data) {
      state = RequestState.success(data);
    });
  }
}

class TrailerMovieNotifier extends StateNotifier<RequestState<Trailer?>> {
  final int id;
  final MovieRepository repository;

  TrailerMovieNotifier(this.id, this.repository)
      : super(const RequestState.initial());

  Future<void> getTrailerMovie() async {
    state = const RequestState.loading();
    final result = await repository.getTrailerMovie(id);
    result.fold((l) {
      state = RequestState.error(l.stringError());
    }, (r) {
      state = RequestState.success(r);
    });
  }
}

final detailMovieProvider = StateNotifierProvider.family<DetailMovieNotifier,
    RequestState<DetailMovie?>, int>(
  (ref, int id) {
    return DetailMovieNotifier(id, ref.watch(movieRepositoryProvider))
      ..getDetailMovie();
  },
);

final trailerMovieProvider = StateNotifierProvider.family.autoDispose<TrailerMovieNotifier,
    RequestState<Trailer?>, int>((ref, int id) {
  return TrailerMovieNotifier(id, ref.watch(movieRepositoryProvider));
});
