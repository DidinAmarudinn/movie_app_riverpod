import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/drawer/setting_drawer.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/screens/latest_movie_screen.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/screens/now_playing_movie_screen.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/screens/popular_movie_screen.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/screens/top_rated_movie_screen.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/screens/upcoming_movie_screen.dart';

class MovieMainScreen extends ConsumerStatefulWidget {
  const MovieMainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MovieMainScreenState();
}

class _MovieMainScreenState extends ConsumerState<MovieMainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
    super.initState();
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: AppBar(
          title: Text(
            "RiverPodMov",
            style:
                TextStyle(color: Theme.of(context).textTheme.headline1?.color),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
              ),
            ),
            Builder(
              builder: (ctx) {
                return IconButton(
                  onPressed: () {
                    displayEndDrawer(ctx);
                  },
                  icon: const Icon(
                    Icons.settings_outlined,
                  ),
                );
              },
            ),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            isScrollable: true,
            labelColor: Theme.of(context).textTheme.headline1?.color,
            tabs: const [
              Tab(
                text: "Now Playing",
              ),
              Tab(
                text: "Latest",
              ),
              Tab(
                text: "Up Coming",
              ),
              Tab(
                text: "Popular",
              ),
              Tab(
                text: "Top Rated",
              ),
            ],
          ),
        ),
      ),
      endDrawer: const SettingDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          NowPlayingMovieScreen(),
          LatestMovieScreen(),
          UpcomingMovieScreen(),
          PopularMovieScreen(),
          TopRatedMovieScreen(),
        ],
      ),
    );
  }
}
