import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/constants/api_constants.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/notifier/detail_movie_notifier.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/screens/detail_movie/detail_section.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/screens/detail_movie/similiar_movie_section.dart';
import 'package:movie_app_riverpod/src/shared_ui/error_widget.dart';
import 'package:movie_app_riverpod/src/shared_ui/loading_widget.dart';
import 'package:movie_app_riverpod/src/utils/theme.dart';

class DetailMovieScreen extends ConsumerStatefulWidget {
  final int id;
  const DetailMovieScreen(this.id, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailMovieScreenState();
}

class _DetailMovieScreenState extends ConsumerState<DetailMovieScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final detailNotifier = ref.watch(detailMovieProvider(widget.id));
    return Scaffold(
      body: detailNotifier.when(
        initial: () => const SizedBox(),
        loading: () => const LoadingWidget(),
        success: (data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.35,
                child: Stack(
                  children: [
                    if (data?.backdropPath != null)
                    Positioned.fill(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: getOriginalImageUrl(data?.backdropPath),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(0.7),
                              ]),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      left: 24,
                      top: 56,
                      bottom: 12,
                      right: 24,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.navigate_before,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline, size: 30,color: Colors.white,))
                            ],
                          ),
                          const Spacer(),
                          Text(
                            data?.title ?? "",
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: ThemeConfig.redColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                                "IMDB ${data?.voteAverage?.toStringAsFixed(1) ?? ""}"),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ThemeConfig.redColor,
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  size: 22,
                                ),
                              ),
                              const Text(
                                "Watch Trailer",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TabBar(
                isScrollable: true,
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: "Detail",
                  ),
                  Tab(
                    text: "Similiars Movie",
                  )
                ],
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  DetailSection(
                    data: data,
                    width: width,
                  ),
                  SimiliarMovieSection(id: data?.id ?? 0)
                ]),
              )
            ],
          );
        },
        error: (error) => ErrorText(
          reload: () {
            ref.read(detailMovieProvider(widget.id).notifier).getDetailMovie();
          },
          error: error,
        ),
      ),
    );
  }
}
