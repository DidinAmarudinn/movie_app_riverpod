import 'package:flutter/material.dart';
import 'package:movie_app_riverpod/src/constants/image_constants.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(seconds: ImageConstants.splashImages.length * 10),
        curve: Curves.linear,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // StaggeredGridView.countBuilder(
            //   padding: const EdgeInsets.all(0),
            //   crossAxisCount: 4,
            //   controller: _scrollController,
            //   itemCount: ImageConstants.splashImages.length,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       color: Colors.black,
            //       child: Image.network(
            //         ImageConstants.splashImages[index],
            //         fit: BoxFit.cover,
            //       ),
            //     );
            //   },
            //   staggeredTileBuilder: (int index) =>
            //       StaggeredTile.count(2, index.isEven ? 4 : 2),
            //   mainAxisSpacing: 2,
            //   crossAxisSpacing: 3,
            // ),
            Positioned(
              left: 0,
              top: 0,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(1),
                      ]),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Movie App",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
