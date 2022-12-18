import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/constants/api_constants.dart';
import 'package:movie_app_riverpod/src/features/movies/domain/entities/movie.dart';

import '../../../../../utils/theme.dart';
import '../detail_movie/detail_movie_screen.dart';

class SectionSearchFilled extends ConsumerWidget {
  final List<Movie> movies;
  const SectionSearchFilled(this.movies, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 12),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          var movie = movies[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMovieScreen(movie.id ?? 0),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  movie.posterPath != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: getImageUrl(movie.posterPath),
                            height: 120,
                            fit: BoxFit.cover,
                            width: 90,
                          ),
                        )
                      : const SizedBox(
                          width: 90,
                          height: 120,
                        ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title ?? "",
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        movie.releaseDate ?? "",
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: ThemeConfig.redColor.withOpacity(0.6),
                        ),
                        child:
                            Text(movie.originalLanguage?.toUpperCase() ?? ""),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
