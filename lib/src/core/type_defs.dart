import 'package:dartz/dartz.dart';
import 'package:movie_app_riverpod/src/exceptions/api_error.dart';

typedef FutureEither<T> = Future<Either<APIError, T>>;
typedef FutureVoid = FutureEither<void>;