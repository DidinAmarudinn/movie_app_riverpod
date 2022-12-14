import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

@freezed
class APIError with _$APIError {
  const factory APIError.invalidApiKey() = _InvalidApiKey;
  const factory APIError.noInternetConnection() = _NoInternetConnection;
  const factory APIError.notFound() = _NotFound;
  const factory APIError.unknown() = _Unknown;
}

extension WeatherErrorAsync on APIError {
  String stringError() => when(
        invalidApiKey: () => 'Invalid API key',
        noInternetConnection: () => 'No Internet connection',
        notFound: () => 'City not found',
        unknown: () => 'Some error occurred',
      );
}
