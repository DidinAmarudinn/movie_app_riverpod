import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_state.freezed.dart';
@freezed
abstract class RequestState<T> with _$RequestState<T> {
  const factory RequestState.initial() = _initial;
  const factory RequestState.loading() = _loading;
  const factory RequestState.success(T data) = _data;
  const factory RequestState.error(String? message) = _error;
}