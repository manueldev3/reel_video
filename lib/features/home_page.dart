import 'package:flutter/material.dart';
import 'package:reel_video_1/common/feed_widget.dart';
import 'package:reel_video_1/core/videos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.live_tv_outlined),
          ),
          title: Center(
            child: TabBar(
              tabAlignment: TabAlignment.center,
              dividerColor: Colors.transparent,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Siguiendo'),
                Tab(text: 'Para ti'),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            /// Siguiendo
            PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: siguiendo.length,
              itemBuilder: (context, index) {
                final videoURL = siguiendo[index];
                return FeedWidget(videoURL: videoURL);
              },
            ),

            /// Para ti
            PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: paraTi.length,
              itemBuilder: (context, index) {
                final videoURL = paraTi[index];
                return FeedWidget(videoURL: videoURL);
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    const Icon(
                      Icons.home_rounded,
                      color: Colors.white,
                    ),
                    const Text(
                      'Inicio',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    const Icon(
                      Icons.group_outlined,
                      color: Colors.white54,
                    ),
                    const Text(
                      'Amigos',
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton.filled(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {},
                icon: const Icon(Icons.add_rounded),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    const Icon(
                      Icons.message_outlined,
                      color: Colors.white54,
                    ),
                    const Text(
                      'Bandeja',
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    const Icon(
                      Icons.person_outlined,
                      color: Colors.white54,
                    ),
                    const Text(
                      'Perfil',
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
