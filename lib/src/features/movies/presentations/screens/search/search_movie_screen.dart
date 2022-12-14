import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/constants/api_constants.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/notifier/movie_notifier.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/screens/search/movie_by_genre_screen.dart';
import 'package:movie_app_riverpod/src/shared_ui/error_widget.dart';
import 'package:movie_app_riverpod/src/shared_ui/loading_widget.dart';
import 'package:movie_app_riverpod/src/shared_ui/textfield_widget.dart';
import 'package:movie_app_riverpod/src/utils/theme.dart';

import '../detail_movie/detail_movie_screen.dart';

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
    final trandingNotifier = ref.watch(itemsTrendingProvider);
    final genresNotfier = ref.watch(movieGenresProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFieldWidget(
                  controller: controller, hintText: "Search your next movie"),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending Now",
                            style:
                                Theme.of(context).textTheme.headline1?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          TextButton(
                              onPressed: () {}, child: const Text("See all"))
                        ],
                      ),
                    ),
                    trandingNotifier.maybeWhen(
                      orElse: () => const LoadingWidget(),
                      data: (data) => SizedBox(
                        height: 185,
                        width: double.infinity,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 16),
                          itemCount: data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailMovieScreen(
                                                  data[index].id ?? 0)));
                                },
                                child: SizedBox(
                                  width: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: data[index].posterPath != null
                                            ? CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                width: 100,
                                                height: 150,
                                                imageUrl: getImageUrl(
                                                    data[index].posterPath))
                                            : const SizedBox(),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        data[index].title ?? "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            ?.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    genresNotfier.maybeWhen(
                      orElse: () => const SizedBox(),
                      loading: () => const LoadingWidget(),
                      success: (data) {
                        return data.genres != null
                            ? Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Genres",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Wrap(
                                      children: data.genres!
                                          .map((e) => InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          MovieByGenreScreen(
                                                        genreId: e.id ?? 0,
                                                        genreName: e.name,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 8,
                                                  ),
                                                  margin: const EdgeInsets.only(
                                                      right: 6, bottom: 6),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ThemeConfig.greyColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Text(
                                                    e.name ?? "",
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox();
                      },
                      error: ((message) => ErrorText(
                            reload: () {
                              ref
                                  .read(movieGenresProvider.notifier)
                                  .getMovieGenres();
                            },
                            error: message,
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
