import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/core/type_defs.dart';
import 'package:movie_app_riverpod/src/exceptions/api_error.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movie_service.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/detail_movie.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/movie.dart';

abstract class MovieRepository {
  FutureEither<List<Movie>> getListPopularMovie(int page);
  FutureEither<List<Movie>> getListUpComing(int page);
  FutureEither<List<Movie>> getListTopRatedMovie(int page);
  FutureEither<List<Movie>> getListNowPlayingMovie(int page);
  FutureEither<List<Movie>> getListLatestMovie(int page);
  FutureEither<List<Movie>> getSimmiliarsMovie(int id, int page);
  FutureEither<DetailMovie?> getDetailMovie(int id);
}

class MovieRepositoryImpl extends MovieRepository {
  final MovieService service;

  MovieRepositoryImpl(this.service);
  @override
  FutureEither<List<Movie>> getListPopularMovie(int page) async {
    try {
      return right(await service.getListPopularMovie(page));
    } catch (e) {
      return left(e as APIError);
    }
  }

  @override
  FutureEither<List<Movie>> getListUpComing(int page) async {
    try {
      return right(await service.getListMovieUpComing(page));
    } catch (e) {
      return left(e as APIError);
    }
  }

  @override
  FutureEither<List<Movie>> getListLatestMovie(int page) async {
    try {
      return right(await service.getListLatestMovie(page));
    } catch (e) {
      return left(e as APIError);
    }
  }

  @override
  FutureEither<List<Movie>> getListNowPlayingMovie(int page) async {
    try {
      return right(await service.getListNowPlayingMovie(page));
    } catch (e) {
      return left(e as APIError);
    }
  }

  @override
  FutureEither<List<Movie>> getListTopRatedMovie(int page) async {
    try {
      return right(await service.getListTopRatedMovie(page));
    } catch (e) {
      return left(e as APIError);
    }
  }

  @override
  FutureEither<DetailMovie?> getDetailMovie(int id) async {
    try {
      return right(await service.getDetailMovie(id));
    } catch (e) {
      return left(e as APIError);
    }
  }

  @override
  FutureEither<List<Movie>> getSimmiliarsMovie(int id, int page) async {
    try {
      return right(await service.getSimmiliarsMovie(id, page));
    } catch (e) {
      return left(e as APIError);
    }
  }
}

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepositoryImpl(ref.watch(movieServiceProvider));
});
