// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'detail_movie.dart';
part 'list_genres.freezed.dart';
part 'list_genres.g.dart';
@freezed
 class ListGenres with _$ListGenres {
    @JsonSerializable(explicitToJson: true)
    const factory ListGenres({
        List<Genre>? genres,
    }) = _ListGenres;
factory ListGenres.fromJson(Map<String, dynamic> json) =>
      _$ListGenresFromJson(json);

}