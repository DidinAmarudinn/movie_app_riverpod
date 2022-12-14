// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListMovie _$$_ListMovieFromJson(Map<String, dynamic> json) => _$_ListMovie(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$$_ListMovieToJson(_$_ListMovie instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
