import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/core/request_state.dart';
import 'package:movie_app_riverpod/src/exceptions/api_error.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movie_repository.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/detail_movie.dart';

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

final detailMovieProvider = StateNotifierProvider.family<DetailMovieNotifier,
    RequestState<DetailMovie?>, int>(
  (ref, int id) {
    return DetailMovieNotifier(id, ref.watch(movieRepositoryProvider))
      ..getDetailMovie();
  },
);
