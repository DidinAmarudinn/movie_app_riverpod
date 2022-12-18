import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/exceptions/api_error.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/notifier/search_movie_notifier.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/screens/search/search_not_found.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/screens/search/section_search_empty.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/screens/search/section_search_filled.dart';
import 'package:movie_app_riverpod/src/shared_ui/error_widget.dart';
import 'package:movie_app_riverpod/src/shared_ui/loading_widget.dart';
import 'package:movie_app_riverpod/src/shared_ui/textfield_widget.dart';

class SearchMovieScreen extends ConsumerStatefulWidget {
  const SearchMovieScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchMovieScreenState();
}

class _SearchMovieScreenState extends ConsumerState<SearchMovieScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchResultNotifier = ref.watch(searchResultsProvider);
    // final searchFuture = ref.watch(searchProvider);
    final query = ref.watch(queryProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFieldWidget(
                  controller: controller,
                  hintText: "Search your next movie",
                  onChanged: (val) async {
                    ref.read(queryProvider.notifier).state = val;
                    // ref.read(itemsSearchMovieProvider.notifier).search();
                    ref.read(searchServiceProvider).searchMovie(val);
                  }),
            ),
            query.isNotEmpty
                ? searchResultNotifier.when(
                    data: (data) {
                      return data.when((movie) {
                        if (movie.isEmpty) {
                          if (query.isEmpty) {
                            return const SectionSearchEmpty();
                          } else {
                            return const SearchNotFound();
                          }
                        } else {
                          return SectionSearchFilled(movie);
                        }
                      }, error: (error) {
                        if (query.isEmpty) {
                          return const SectionSearchEmpty();
                        }
                        if (error != const APIError.unknown()) {
                          return ErrorText(
                            error: error.stringError(),
                            reload: () {
                              ref
                                  .read(itemsSearchMovieProvider.notifier)
                                  .search();
                            },
                          );
                        }
                        return const SizedBox();
                      });
                    },
                    error: ((error, stackTrace) {
                      if (query.isEmpty) {
                        return const SectionSearchEmpty();
                      }
                      return ErrorText(
                        error: error.toString(),
                        reload: () {
                          ref.read(itemsSearchMovieProvider.notifier).search();
                        },
                      );
                    }),
                    loading: () => const LoadingWidget(),
                  )
                : const SectionSearchEmpty(),
          ],
        ),
      ),
    );
  }
}
