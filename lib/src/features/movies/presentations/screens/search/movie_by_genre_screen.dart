import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/notifier/movie_notifier.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/widget/items_movie.dart';

import '../../../../../shared_ui/pagnation_widget.dart';

class MovieByGenreScreen extends ConsumerStatefulWidget {
  final int genreId;
  final String? genreName;
  const MovieByGenreScreen({
    super.key,
    required this.genreId,
    this.genreName,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MovieByGenreScreenState();
}

class _MovieByGenreScreenState extends ConsumerState<MovieByGenreScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.width * 0.20;
      if (maxScroll - currentScroll <= delta) {
        ref
            .read(itemsMovieByGenreProvider(widget.genreId).notifier)
            .fetchNextBatch();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.genreName ?? "",
          style: Theme.of(context).textTheme.headline1?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          MovieItemList(
            stateNotifierProvider: itemsMovieByGenreProvider(widget.genreId),
            onTap: () {
              ref
                  .read(itemsMovieByGenreProvider(widget.genreId).notifier)
                  .fetchFirstBatch();
            },
          ),
          NoMoreItems(
            stateNotifierProvider: itemsMovieByGenreProvider(widget.genreId),
            callback: () => ref
                .read(itemsMovieByGenreProvider(widget.genreId).notifier)
                .noMoreItems,
          ),
          OnGoingBottomWidget(
            stateNotifierProvider: itemsMovieByGenreProvider(widget.genreId),
          ),
        ],
      ),
    );
  }
}
