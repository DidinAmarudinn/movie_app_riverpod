// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_riverpod/src/constants/api_constants.dart';

import 'package:movie_app_riverpod/src/features/movies/domain/entities/detail_movie.dart';
import 'package:movie_app_riverpod/src/utils/theme.dart';

class DetailSection extends StatelessWidget {
  final DetailMovie? data;
  final double width;
  const DetailSection({
    Key? key,
    required this.data,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    height: width * 0.5,
                    width: width * 0.35,
                    imageUrl: getImageUrl(data?.posterPath),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data?.title ?? "",
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        data?.releaseDate ?? "",
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
                            Text(data?.originalLanguage?.toUpperCase() ?? ""),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Genre",
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      if (data?.genres != null)
                        Wrap(
                          children: data!.genres!
                              .map((e) => Container(
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.only(right: 6,bottom: 6),
                                  decoration: BoxDecoration(
                                    color: ThemeConfig.greyColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    e.name ?? "",
                                    style: const TextStyle(
                                        color:Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  )))
                              .toList(),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Description",
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            data?.overview ?? "",
            style: Theme.of(context).textTheme.headline1?.copyWith(
                fontSize: 13, fontWeight: FontWeight.w300, height: 1.5),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Production Companies",
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          if (data?.productionCompanies != null)
            Wrap(
              children: data!.productionCompanies!
                  .map((e) => Container(
                      padding: const EdgeInsets.all(6),
                      margin: const EdgeInsets.only(right: 6, bottom: 7),
                      decoration: BoxDecoration(
                        color: ThemeConfig.greyColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        e.name ?? "",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline1?.color,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      )))
                  .toList(),
            )
        ],
      ),
    );
  }
}
