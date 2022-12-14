// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_genres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListGenres _$$_ListGenresFromJson(Map<String, dynamic> json) =>
    _$_ListGenres(
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListGenresToJson(_$_ListGenres instance) =>
    <String, dynamic>{
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
    };
