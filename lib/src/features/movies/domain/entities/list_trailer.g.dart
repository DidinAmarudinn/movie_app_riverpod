// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_trailer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListTrailerVideo _$$_ListTrailerVideoFromJson(Map<String, dynamic> json) =>
    _$_ListTrailerVideo(
      id: json['id'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Trailer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListTrailerVideoToJson(_$_ListTrailerVideo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

_$_Trailer _$$_TrailerFromJson(Map<String, dynamic> json) => _$_Trailer(
      name: json['name'] as String?,
      key: json['key'] as String?,
      site: json['site'] as String?,
      size: json['size'] as int?,
      type: json['type'] as String?,
      official: json['official'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_TrailerToJson(_$_Trailer instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'id': instance.id,
    };
