import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/features/movies/presentations/notifier/detail_movie_notifier.dart';
import 'package:movie_app_riverpod/src/shared_ui/error_widget.dart';
import 'package:movie_app_riverpod/src/shared_ui/loading_widget.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TrailerDialog extends ConsumerStatefulWidget {
  final int id;
  const TrailerDialog(this.id, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TrailerDialogState();
}

class _TrailerDialogState extends ConsumerState<TrailerDialog> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    getVideoUrl();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );
  }

  Future getVideoUrl() async {
    Future.microtask(() {
      ref.read(trailerMovieProvider(widget.id).notifier).getTrailerMovie();
    });
  }

  @override
  Widget build(BuildContext context) {
    final trailerProvider = ref.watch(trailerMovieProvider(widget.id));
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      child: trailerProvider.when(
        initial: () => const SizedBox(),
        loading: () => const LoadingWidget(),
        success: (data) {
          
          _controller.onInit = () {
            _controller.loadVideoById(videoId: data?.key ?? "");
          };
          return Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.close)),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: YoutubePlayer(
                    controller: _controller,
                  ),
                ),
              ),
            ],
          );
        },
        error: (error) => ErrorText(
          reload: () {
            ref
                .read(trailerMovieProvider(widget.id).notifier)
                .getTrailerMovie();
          },
        ),
      ),
    );
  }
}
