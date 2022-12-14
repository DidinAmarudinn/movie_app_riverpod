import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/notifier/movie_notifier.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/widget/items_movie.dart';

import '../../../../../shared_ui/pagnation_widget.dart';

class LatestMovieScreen extends ConsumerStatefulWidget {
  const LatestMovieScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LatestMovieScreenState();
}

class _LatestMovieScreenState extends ConsumerState<LatestMovieScreen> {
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
        ref.read(itemsLatestMovieProvider.notifier).fetchNextBatch();
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
            stateNotifierProvider: itemsLatestMovieProvider,
            onTap: () {
              ref.read(itemsLatestMovieProvider.notifier).fetchFirstBatch();
            },
          ),
          NoMoreItems(
            stateNotifierProvider: itemsLatestMovieProvider,
            callback: () =>
                ref.read(itemsLatestMovieProvider.notifier).noMoreItems,
          ),
          OnGoingBottomWidget(
            stateNotifierProvider: itemsLatestMovieProvider,
          ),
        ],
      ),
    );
  }
}
