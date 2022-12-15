// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_trailer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListTrailerVideo _$ListTrailerVideoFromJson(Map<String, dynamic> json) {
  return _ListTrailerVideo.fromJson(json);
}

/// @nodoc
mixin _$ListTrailerVideo {
  int? get id => throw _privateConstructorUsedError;
  List<Trailer>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListTrailerVideoCopyWith<ListTrailerVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTrailerVideoCopyWith<$Res> {
  factory $ListTrailerVideoCopyWith(
          ListTrailerVideo value, $Res Function(ListTrailerVideo) then) =
      _$ListTrailerVideoCopyWithImpl<$Res, ListTrailerVideo>;
  @useResult
  $Res call({int? id, List<Trailer>? results});
}

/// @nodoc
class _$ListTrailerVideoCopyWithImpl<$Res, $Val extends ListTrailerVideo>
    implements $ListTrailerVideoCopyWith<$Res> {
  _$ListTrailerVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Trailer>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListTrailerVideoCopyWith<$Res>
    implements $ListTrailerVideoCopyWith<$Res> {
  factory _$$_ListTrailerVideoCopyWith(
          _$_ListTrailerVideo value, $Res Function(_$_ListTrailerVideo) then) =
      __$$_ListTrailerVideoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, List<Trailer>? results});
}

/// @nodoc
class __$$_ListTrailerVideoCopyWithImpl<$Res>
    extends _$ListTrailerVideoCopyWithImpl<$Res, _$_ListTrailerVideo>
    implements _$$_ListTrailerVideoCopyWith<$Res> {
  __$$_ListTrailerVideoCopyWithImpl(
      _$_ListTrailerVideo _value, $Res Function(_$_ListTrailerVideo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? results = freezed,
  }) {
    return _then(_$_ListTrailerVideo(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Trailer>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ListTrailerVideo implements _ListTrailerVideo {
  const _$_ListTrailerVideo({this.id, final List<Trailer>? results})
      : _results = results;

  factory _$_ListTrailerVideo.fromJson(Map<String, dynamic> json) =>
      _$$_ListTrailerVideoFromJson(json);

  @override
  final int? id;
  final List<Trailer>? _results;
  @override
  List<Trailer>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListTrailerVideo(id: $id, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListTrailerVideo &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListTrailerVideoCopyWith<_$_ListTrailerVideo> get copyWith =>
      __$$_ListTrailerVideoCopyWithImpl<_$_ListTrailerVideo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListTrailerVideoToJson(
      this,
    );
  }
}

abstract class _ListTrailerVideo implements ListTrailerVideo {
  const factory _ListTrailerVideo(
      {final int? id, final List<Trailer>? results}) = _$_ListTrailerVideo;

  factory _ListTrailerVideo.fromJson(Map<String, dynamic> json) =
      _$_ListTrailerVideo.fromJson;

  @override
  int? get id;
  @override
  List<Trailer>? get results;
  @override
  @JsonKey(ignore: true)
  _$$_ListTrailerVideoCopyWith<_$_ListTrailerVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

Trailer _$TrailerFromJson(Map<String, dynamic> json) {
  return _Trailer.fromJson(json);
}

/// @nodoc
mixin _$Trailer {
  String? get name => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  String? get site => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get official => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrailerCopyWith<Trailer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrailerCopyWith<$Res> {
  factory $TrailerCopyWith(Trailer value, $Res Function(Trailer) then) =
      _$TrailerCopyWithImpl<$Res, Trailer>;
  @useResult
  $Res call(
      {String? name,
      String? key,
      String? site,
      int? size,
      String? type,
      bool? official,
      String? id});
}

/// @nodoc
class _$TrailerCopyWithImpl<$Res, $Val extends Trailer>
    implements $TrailerCopyWith<$Res> {
  _$TrailerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? key = freezed,
    Object? site = freezed,
    Object? size = freezed,
    Object? type = freezed,
    Object? official = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      official: freezed == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrailerCopyWith<$Res> implements $TrailerCopyWith<$Res> {
  factory _$$_TrailerCopyWith(
          _$_Trailer value, $Res Function(_$_Trailer) then) =
      __$$_TrailerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? key,
      String? site,
      int? size,
      String? type,
      bool? official,
      String? id});
}

/// @nodoc
class __$$_TrailerCopyWithImpl<$Res>
    extends _$TrailerCopyWithImpl<$Res, _$_Trailer>
    implements _$$_TrailerCopyWith<$Res> {
  __$$_TrailerCopyWithImpl(_$_Trailer _value, $Res Function(_$_Trailer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? key = freezed,
    Object? site = freezed,
    Object? size = freezed,
    Object? type = freezed,
    Object? official = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Trailer(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      official: freezed == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Trailer implements _Trailer {
  const _$_Trailer(
      {this.name,
      this.key,
      this.site,
      this.size,
      this.type,
      this.official,
      this.id});

  factory _$_Trailer.fromJson(Map<String, dynamic> json) =>
      _$$_TrailerFromJson(json);

  @override
  final String? name;
  @override
  final String? key;
  @override
  final String? site;
  @override
  final int? size;
  @override
  final String? type;
  @override
  final bool? official;
  @override
  final String? id;

  @override
  String toString() {
    return 'Trailer(name: $name, key: $key, site: $site, size: $size, type: $type, official: $official, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Trailer &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.official, official) ||
                other.official == official) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, key, site, size, type, official, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrailerCopyWith<_$_Trailer> get copyWith =>
      __$$_TrailerCopyWithImpl<_$_Trailer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrailerToJson(
      this,
    );
  }
}

abstract class _Trailer implements Trailer {
  const factory _Trailer(
      {final String? name,
      final String? key,
      final String? site,
      final int? size,
      final String? type,
      final bool? official,
      final String? id}) = _$_Trailer;

  factory _Trailer.fromJson(Map<String, dynamic> json) = _$_Trailer.fromJson;

  @override
  String? get name;
  @override
  String? get key;
  @override
  String? get site;
  @override
  int? get size;
  @override
  String? get type;
  @override
  bool? get official;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_TrailerCopyWith<_$_Trailer> get copyWith =>
      throw _privateConstructorUsedError;
}
