import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:movie_app_riverpod/src/features/movies/presentations/notifier/movie_notifier.dart';

import '../../../../../constants/api_constants.dart';
import '../../../../../constants/image_constants.dart';
import '../../../../../shared_ui/pagnation_widget.dart';
import '../../../domain/entities/movie.dart';
import 'detail_movie_screen.dart';

class SimiliarMovieSection extends ConsumerStatefulWidget {
  final int id;
  const SimiliarMovieSection({super.key, 
    required this.id,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SimiliarMovieSectionState();
}

class _SimiliarMovieSectionState extends ConsumerState<SimiliarMovieSection> {
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
        ref.read(itemsSimmiliarsMovieProvider(widget.id).notifier).fetchNextBatch();
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
          SimiliarItemList(
            stateNotifierProvider: itemsSimmiliarsMovieProvider(widget.id),
            onTap: () {
              ref.read(itemsSimmiliarsMovieProvider(widget.id).notifier).fetchFirstBatch();
            },
          ),
          NoMoreItems(
            stateNotifierProvider: itemsSimmiliarsMovieProvider(widget.id),
            callback: () =>
                ref.read(itemsSimmiliarsMovieProvider(widget.id).notifier).noMoreItems,
          ),
          OnGoingBottomWidget(
            stateNotifierProvider: itemsSimmiliarsMovieProvider(widget.id),
          ),
        ],
      ),
    );
  }
}

class SimiliarItemList extends StatelessWidget {
  final StateNotifierProvider stateNotifierProvider;
  final VoidCallback onTap;
  const SimiliarItemList(
      {Key? key, required this.stateNotifierProvider, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(stateNotifierProvider);
      return state.when(
        data: (items) {
          return items.isEmpty
              ? SliverToBoxAdapter(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: onTap,
                        icon: const Icon(Icons.replay),
                      ),
                      const Chip(
                        label: Text("No items Found!"),
                      ),
                    ],
                  ),
                )
              : ItemsListSimiliarBuilder(
                  items: items,
                );
        },
        loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator())),
        error: (e) => SliverToBoxAdapter(
          child: Center(
            child: Column(
              children: [
                const Icon(Icons.info),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  e,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        onGoingLoading: (items) {
          return ItemsListSimiliarBuilder(
            items: items,
          );
        },
        onGoingError: (items, e) {
          return ItemsListSimiliarBuilder(
            items: items,
          );
        },
      );
    });
  }
}

class ItemsListSimiliarBuilder extends StatelessWidget {
  const ItemsListSimiliarBuilder({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Movie> items;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GridView.custom(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 12,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: const [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(2, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMovieScreen(items[index].id ?? 0)));
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child:items[index].posterPath != null ? CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: getOriginalImageUrl(
                          items[index].posterPath,
                        ),
                        errorWidget: ((context, url, error) => Image.asset(
                            ImageConstants.imageNotFound,
                            fit: BoxFit.cover)),
                      ): const SizedBox(),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(1),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Text(
                      items[index].voteAverage?.toStringAsFixed(1) ?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                 
                ],
              ),
            );
          },
          childCount: items.length,
        ),
      ),
    );
  }
}
