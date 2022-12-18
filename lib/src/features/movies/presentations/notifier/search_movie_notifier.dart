import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/core/request_state.dart';
import 'package:movie_app_riverpod/src/exceptions/api_error.dart';
import 'package:movie_app_riverpod/src/features/movies/data/movie_repository.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/movie.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/search_movie_result.dart';
import 'package:rxdart/rxdart.dart';

class SearchMovieNotifier extends StateNotifier<RequestState<List<Movie>>> {
  final Ref ref;

  SearchMovieNotifier(this.ref) : super(const RequestState.initial());

  Future<void> search() async {
    String query = ref.read(queryProvider);
    state = const RequestState.loading();
    final repository = ref.watch(movieRepositoryProvider);
    final result = await repository.searchMovie(query);
    result.fold((l) {
      state = RequestState.error(l.stringError());
    }, (r) {
      state = RequestState.success(r);
    });
  }
}

final itemsSearchMovieProvider =
    StateNotifierProvider<SearchMovieNotifier, RequestState<List<Movie>>>(
        (ref) {
  return SearchMovieNotifier(ref);
});

final queryProvider = StateProvider.autoDispose((ref) {
  return "";
});

// final searchProvider = FutureProvider<List<Movie>>((ref) async {
//   String query = ref.watch(queryProvider);
//   await ref.debounce(const Dura)
//   return ref.watch(movieServiceProvider).searchMovie(query);
// });

class SearchService {
  final MovieRepository repository;
  late Stream<SearchMovieResult> _results;
  Stream<SearchMovieResult> get results => _results;

  SearchService({required this.repository}) {
    // Implementation based on: https://youtu.be/7O1UO5rEpRc
    // ReactiveConf 2018 - Brian Egan & Filip Hracek: Practical Rx with Flutter
    _results = _searchTerms
        .debounce((_) => TimerStream(true, const Duration(milliseconds: 500)))
        .switchMap((query) async* {
          yield await search(query);
    }); // discard previous events
  }

  final _searchTerms = BehaviorSubject<String>();
  void searchMovie(String query) {
   return _searchTerms.add(query);
  }

  Future<SearchMovieResult> search(String query) async {
    final res = await repository.searchMovie(query);
    late SearchMovieResult result;
    res.fold((l) {
      result =  SearchMovieResult.error(l);
    }, (r) {
      result = SearchMovieResult(r);
    });
    return result;
  }

  void dispose() {
    _searchTerms.close();
  }
}

final searchServiceProvider = Provider<SearchService>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return SearchService(repository: repository);
});

final searchResultsProvider =
    StreamProvider.autoDispose<SearchMovieResult>((ref) {
  final service = ref.watch(searchServiceProvider);
  return service.results;
});
