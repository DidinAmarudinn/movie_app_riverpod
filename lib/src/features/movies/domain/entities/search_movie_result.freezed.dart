// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_movie_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchMovieResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Movie> movie) $default, {
    required TResult Function(APIError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Movie> movie)? $default, {
    TResult? Function(APIError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Movie> movie)? $default, {
    TResult Function(APIError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(data value) $default, {
    required TResult Function(searchError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(data value)? $default, {
    TResult? Function(searchError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(data value)? $default, {
    TResult Function(searchError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchMovieResultCopyWith<$Res> {
  factory $SearchMovieResultCopyWith(
          SearchMovieResult value, $Res Function(SearchMovieResult) then) =
      _$SearchMovieResultCopyWithImpl<$Res, SearchMovieResult>;
}

/// @nodoc
class _$SearchMovieResultCopyWithImpl<$Res, $Val extends SearchMovieResult>
    implements $SearchMovieResultCopyWith<$Res> {
  _$SearchMovieResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$dataCopyWith<$Res> {
  factory _$$dataCopyWith(_$data value, $Res Function(_$data) then) =
      __$$dataCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Movie> movie});
}

/// @nodoc
class __$$dataCopyWithImpl<$Res>
    extends _$SearchMovieResultCopyWithImpl<$Res, _$data>
    implements _$$dataCopyWith<$Res> {
  __$$dataCopyWithImpl(_$data _value, $Res Function(_$data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
  }) {
    return _then(_$data(
      null == movie
          ? _value._movie
          : movie // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc

class _$data implements data {
  const _$data(final List<Movie> movie) : _movie = movie;

  final List<Movie> _movie;
  @override
  List<Movie> get movie {
    if (_movie is EqualUnmodifiableListView) return _movie;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movie);
  }

  @override
  String toString() {
    return 'SearchMovieResult(movie: $movie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$data &&
            const DeepCollectionEquality().equals(other._movie, _movie));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_movie));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$dataCopyWith<_$data> get copyWith =>
      __$$dataCopyWithImpl<_$data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Movie> movie) $default, {
    required TResult Function(APIError error) error,
  }) {
    return $default(movie);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Movie> movie)? $default, {
    TResult? Function(APIError error)? error,
  }) {
    return $default?.call(movie);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Movie> movie)? $default, {
    TResult Function(APIError error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(movie);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(data value) $default, {
    required TResult Function(searchError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(data value)? $default, {
    TResult? Function(searchError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(data value)? $default, {
    TResult Function(searchError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class data implements SearchMovieResult {
  const factory data(final List<Movie> movie) = _$data;

  List<Movie> get movie;
  @JsonKey(ignore: true)
  _$$dataCopyWith<_$data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$searchErrorCopyWith<$Res> {
  factory _$$searchErrorCopyWith(
          _$searchError value, $Res Function(_$searchError) then) =
      __$$searchErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({APIError error});

  $APIErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$searchErrorCopyWithImpl<$Res>
    extends _$SearchMovieResultCopyWithImpl<$Res, _$searchError>
    implements _$$searchErrorCopyWith<$Res> {
  __$$searchErrorCopyWithImpl(
      _$searchError _value, $Res Function(_$searchError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$searchError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as APIError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $APIErrorCopyWith<$Res> get error {
    return $APIErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$searchError implements searchError {
  const _$searchError(this.error);

  @override
  final APIError error;

  @override
  String toString() {
    return 'SearchMovieResult.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$searchError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$searchErrorCopyWith<_$searchError> get copyWith =>
      __$$searchErrorCopyWithImpl<_$searchError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Movie> movie) $default, {
    required TResult Function(APIError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Movie> movie)? $default, {
    TResult? Function(APIError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Movie> movie)? $default, {
    TResult Function(APIError error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(data value) $default, {
    required TResult Function(searchError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(data value)? $default, {
    TResult? Function(searchError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(data value)? $default, {
    TResult Function(searchError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class searchError implements SearchMovieResult {
  const factory searchError(final APIError error) = _$searchError;

  APIError get error;
  @JsonKey(ignore: true)
  _$$searchErrorCopyWith<_$searchError> get copyWith =>
      throw _privateConstructorUsedError;
}
