import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/notifier/movie_notifier.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/widget/items_movie.dart';

import '../../../../../shared_ui/pagnation_widget.dart';

class UpcomingMovieScreen extends ConsumerStatefulWidget {
  const UpcomingMovieScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpcomingMovieScreenState();
}

class _UpcomingMovieScreenState extends ConsumerState<UpcomingMovieScreen> {
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
        ref.read(itemsUpcomingMovieProvider.notifier).fetchNextBatch();
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
            stateNotifierProvider: itemsUpcomingMovieProvider,
            onTap: () {
              ref.read(itemsUpcomingMovieProvider.notifier).fetchFirstBatch();
            },
          ),
          NoMoreItems(
            stateNotifierProvider: itemsUpcomingMovieProvider,
            callback: () =>
                ref.read(itemsUpcomingMovieProvider.notifier).noMoreItems,
          ),
          OnGoingBottomWidget(
            stateNotifierProvider: itemsUpcomingMovieProvider,
          ),
        ],
      ),
    );
  }
}
