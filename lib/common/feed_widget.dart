import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key, required this.videoURL});

  final String videoURL;

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoURL),
    )
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.black12,
                Colors.black,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Location Button
                        FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.black26,
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.location_pin),
                          label: Text('Bogotá'),
                        ),
                        const SizedBox(height: 8),

                        /// User name
                        Text(
                          'Manuel Fernández',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        /// Description area
                        Text(
                          'Descripción del video',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      /// User
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.fromBorderSide(
                                BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: ClipOval(
                              child: Image.network(
                                'https://manueldeveloper.com/img/avatar.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: IconButton.filled(
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.red,
                                  iconSize: 16,
                                  minimumSize: const Size(24, 24),
                                ),
                                onPressed: () {},
                                icon: const Icon(Icons.send_rounded),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      /// Likes
                      Column(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              iconSize: 32,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_rounded,
                            ),
                          ),
                          const Text(
                            '15.4k',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      /// Comments
                      Column(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              iconSize: 32,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.comment_rounded,
                            ),
                          ),
                          const Text(
                            '13.2k',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      /// Saved
                      Column(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              iconSize: 32,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.bookmark_rounded,
                            ),
                          ),
                          const Text(
                            '12.5k',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      /// Share
                      Column(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              iconSize: 32,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_rounded,
                            ),
                          ),
                          const Text(
                            'Compartir',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
