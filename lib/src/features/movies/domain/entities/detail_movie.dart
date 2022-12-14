// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_movie.freezed.dart';
part 'detail_movie.g.dart';

@freezed
class DetailMovie with _$DetailMovie {
  @JsonSerializable(explicitToJson: true)
  const factory DetailMovie({
    bool? adult,
    @JsonKey(name: "backdrop_path") String? backdropPath,
    @JsonKey(name: "belongs_to_collection")
        BelongsToCollection? belongsToCollection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    @JsonKey(name: "imdb_id") String? imdbId,
    @JsonKey(name: "original_language") String? originalLanguage,
    @JsonKey(name: "original_title") String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "production_companies")
        List<ProductionCompany>? productionCompanies,
    @JsonKey(name: "production_countries")
        List<ProductionCountry>? productionCountries,
    @JsonKey(name: "release_date") String? releaseDate,
    int? revenue,
    int? runtime,
    @JsonKey(name: "spoken_languages") List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    @JsonKey(name: "vote_average") double? voteAverage,
    @JsonKey(name: "vote_count") int? voteCount,
  }) = _DetailMovie;

  factory DetailMovie.fromJson(Map<String, dynamic> json) =>
      _$DetailMovieFromJson(json);
}

@freezed
class BelongsToCollection with _$BelongsToCollection {
  const factory BelongsToCollection({
    int? id,
    String? name,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "backdrop_path") String? backdropPath,
  }) = _BelongsToCollection;

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    int? id,
    String? name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@freezed
class ProductionCountry with _$ProductionCountry {
  const factory ProductionCountry({
    String? iso31661,
    String? name,
  }) = _ProductionCountry;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
}

@freezed
class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    String? englishName,
    String? iso6391,
    String? name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
