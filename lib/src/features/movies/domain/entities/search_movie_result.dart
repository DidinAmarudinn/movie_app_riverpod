import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_riverpod/src/exceptions/api_error.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/movie.dart';
part 'search_movie_result.freezed.dart';
@freezed
class SearchMovieResult with _$SearchMovieResult {
  const factory SearchMovieResult(List<Movie> movie) = data;
  const factory SearchMovieResult.error(APIError error) = searchError;
}
