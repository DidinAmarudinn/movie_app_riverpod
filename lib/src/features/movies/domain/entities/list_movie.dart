// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/movie.dart';
part 'list_movie.freezed.dart';
part 'list_movie.g.dart';


@freezed
 class ListMovie with _$ListMovie {
  @JsonSerializable(explicitToJson: true)
  const factory ListMovie({
    int? page,
    List<Movie>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _ListMovie;

  factory ListMovie.fromJson(Map<String, dynamic> json) =>
      _$ListMovieFromJson(json);
}
