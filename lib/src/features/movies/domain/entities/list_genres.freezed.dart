// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_genres.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListGenres _$ListGenresFromJson(Map<String, dynamic> json) {
  return _ListGenres.fromJson(json);
}

/// @nodoc
mixin _$ListGenres {
  List<Genre>? get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListGenresCopyWith<ListGenres> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListGenresCopyWith<$Res> {
  factory $ListGenresCopyWith(
          ListGenres value, $Res Function(ListGenres) then) =
      _$ListGenresCopyWithImpl<$Res, ListGenres>;
  @useResult
  $Res call({List<Genre>? genres});
}

/// @nodoc
class _$ListGenresCopyWithImpl<$Res, $Val extends ListGenres>
    implements $ListGenresCopyWith<$Res> {
  _$ListGenresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = freezed,
  }) {
    return _then(_value.copyWith(
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListGenresCopyWith<$Res>
    implements $ListGenresCopyWith<$Res> {
  factory _$$_ListGenresCopyWith(
          _$_ListGenres value, $Res Function(_$_ListGenres) then) =
      __$$_ListGenresCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Genre>? genres});
}

/// @nodoc
class __$$_ListGenresCopyWithImpl<$Res>
    extends _$ListGenresCopyWithImpl<$Res, _$_ListGenres>
    implements _$$_ListGenresCopyWith<$Res> {
  __$$_ListGenresCopyWithImpl(
      _$_ListGenres _value, $Res Function(_$_ListGenres) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = freezed,
  }) {
    return _then(_$_ListGenres(
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ListGenres implements _ListGenres {
  const _$_ListGenres({final List<Genre>? genres}) : _genres = genres;

  factory _$_ListGenres.fromJson(Map<String, dynamic> json) =>
      _$$_ListGenresFromJson(json);

  final List<Genre>? _genres;
  @override
  List<Genre>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListGenres(genres: $genres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListGenres &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListGenresCopyWith<_$_ListGenres> get copyWith =>
      __$$_ListGenresCopyWithImpl<_$_ListGenres>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListGenresToJson(
      this,
    );
  }
}

abstract class _ListGenres implements ListGenres {
  const factory _ListGenres({final List<Genre>? genres}) = _$_ListGenres;

  factory _ListGenres.fromJson(Map<String, dynamic> json) =
      _$_ListGenres.fromJson;

  @override
  List<Genre>? get genres;
  @override
  @JsonKey(ignore: true)
  _$$_ListGenresCopyWith<_$_ListGenres> get copyWith =>
      throw _privateConstructorUsedError;
}
