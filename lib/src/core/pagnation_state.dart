import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagnation_state.freezed.dart';

@freezed
abstract class PagnationState<T> with _$PagnationState<T> {
  const factory PagnationState.data(List<T> items) = _Data;
  const factory PagnationState.loading() = _Loading;
  const factory PagnationState.error(String message) = _Error;
  const factory PagnationState.onGoingLoading(List<T> items) = _OnGoingLoading;
  const factory PagnationState.onGoingError(List<T> items, String error) =
      _OnGoingError;
}
