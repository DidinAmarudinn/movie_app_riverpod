import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/constants/api_constants.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/detail_movie.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/list_genres.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/list_movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_riverpod/src/features/movies/domain/entities/list_trailer.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/movie.dart';

import '../../../exceptions/api_error.dart';

abstract class MovieService {
  Future<List<Movie>> getListPopularMovie(int page);
  Future<List<Movie>> getListMovieUpComing(int page);
  Future<List<Movie>> getListLatestMovie(int page);
  Future<List<Movie>> getListTopRatedMovie(int page);
  Future<List<Movie>> getListNowPlayingMovie(int page);
  Future<DetailMovie> getDetailMovie(int id);
  Future<List<Movie>> getSimmiliarsMovie(int id, int page);
  Future<List<Movie>> getTrandingMovei();
  Future<ListGenres> getMovieGenres();
  Future<List<Movie>> getMoviesByGenres(int idGenre, int page);
  Future<Trailer?> getMovieTrailer(int id);
  Future<List<Movie>> searchMovie(String query);
}

class MovieServiceImpl extends MovieService {
  final http.Client client;

  MovieServiceImpl({required this.client});
  @override
  Future<List<Movie>> getListPopularMovie(int page) async => _getData(
        uri: Uri.parse("$popularMovieUrl$page"),
        builder: (data) => ListMovie.fromJson(data).results ?? [],
      );

  @override
  Future<List<Movie>> getListMovieUpComing(int page) async => _getData(
        uri: Uri.parse("$upcomingMovieUrl$page"),
        builder: (data) => ListMovie.fromJson(data).results ?? [],
      );

  @override
  Future<List<Movie>> getListLatestMovie(int page) => _getData(
        uri: Uri.parse("$latestMovieUrl$page"),
        builder: (data) => ListMovie.fromJson(data).results ?? [],
      );

  @override
  Future<List<Movie>> getListNowPlayingMovie(int page) => _getData(
        uri: Uri.parse("$nowPlayingMovieUrl$page"),
        builder: (data) => ListMovie.fromJson(data).results ?? [],
      );

  @override
  Future<List<Movie>> getListTopRatedMovie(int page) => _getData(
        uri: Uri.parse("$topRatedMovieUrl$page"),
        builder: (data) => ListMovie.fromJson(data).results ?? [],
      );

  @override
  Future<DetailMovie> getDetailMovie(int id) => _getData(
        uri: Uri.parse("$detailMovieUrl/$id?$apiKey"),
        builder: (data) => DetailMovie.fromJson(data),
      );

  @override
  Future<List<Movie>> getSimmiliarsMovie(int id, int page) => _getData(
        uri: Uri.parse(
            "$simmiliarsMovieUrl/$id/recommendations?$apiKey&page=$page"),
        builder: (data) => ListMovie.fromJson(data).results ?? [],
      );
  @override
  Future<List<Movie>> getTrandingMovei() => _getData(
        uri: Uri.parse(trandingMovieUrl),
        builder: (data) => ListMovie.fromJson(data).results ?? [],
      );

  @override
  Future<ListGenres> getMovieGenres() => _getData(
        uri: Uri.parse(genresMovieUrl),
        builder: (data) => ListGenres.fromJson(data),
      );

  @override
  Future<List<Movie>> getMoviesByGenres(int idGenre, int page) => _getData(
        uri: Uri.parse("$getMovieByGenreUrl$idGenre&page=$page"),
        builder: (data) => ListMovie.fromJson(data).results ?? [],
      );

  @override
  Future<Trailer?> getMovieTrailer(int id) => _getData(
        uri: Uri.parse("$getMovieTrailerUrl/$id/videos?$apiKey"),
        builder: (data) => ListTrailerVideo.fromJson(data).results?[0],
      );

  @override
  Future<List<Movie>> searchMovie(String query) {
    return _getData(
      uri: Uri.parse("$searchMovieUrl$query"),
      builder: (data) => ListMovie.fromJson(data).results ?? [],
    );
  }

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw const APIError.invalidApiKey();
        case 404:
          throw const APIError.notFound();
        default:
          throw const APIError.unknown();
      }
    } on SocketException catch (_) {
      throw const APIError.noInternetConnection();
    }
  }
}

final httpProviderProvider = Provider<http.Client>((ref) {
  return http.Client();
});

final movieServiceProvider = Provider<MovieService>((ref) {
  return MovieServiceImpl(client: ref.read(httpProviderProvider));
});
