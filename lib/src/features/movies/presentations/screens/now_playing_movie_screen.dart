import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/notifier/movie_notifier.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/widget/items_movie.dart';

import '../../../../shared_ui/pagnation_widget.dart';

class NowPlayingMovieScreen extends ConsumerStatefulWidget {
  const NowPlayingMovieScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NowPlayingMovieScreenState();
}

class _NowPlayingMovieScreenState extends ConsumerState<NowPlayingMovieScreen> {
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
        ref.read(itemsNowPlayingMovieProvider.notifier).fetchNextBatch();
      }
    });
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          MovieItemList(
            stateNotifierProvider: itemsNowPlayingMovieProvider,
            onTap: () {
              ref.read(itemsNowPlayingMovieProvider.notifier).fetchFirstBatch();
            },
          ),
          NoMoreItems(
            stateNotifierProvider: itemsNowPlayingMovieProvider,
            callback: () =>
                ref.read(itemsNowPlayingMovieProvider.notifier).noMoreItems,
          ),
          OnGoingBottomWidget(
            stateNotifierProvider: itemsNowPlayingMovieProvider,
          ),
        ],
      ),
    );
  }
}
