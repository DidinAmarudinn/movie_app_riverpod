import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/constants/api_constants.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/detail_movie.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/list_movie.dart';
import 'package:http/http.dart' as http;
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
  Future<List<Movie>> getSimmiliarsMovie(int id, int page) =>  _getData(
        uri: Uri.parse("$simmiliarsMovieUrl/$id/recommendations?$apiKey&page=$page"),
        builder: (data) => ListMovie.fromJson(data).results ?? [],
      );

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      log(response.body);
     log("$detailMovieUrl${"400"}?$apiKey");
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
