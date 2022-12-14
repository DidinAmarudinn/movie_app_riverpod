import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/core/request_state.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/movie.dart';

class SearchMovieNotifier extends StateNotifier<RequestState<List<Movie>>> {
  final String query;

  SearchMovieNotifier(this.query) : super(const RequestState.initial());


  Future<void> search() async {

  }
}




