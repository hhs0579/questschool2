import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quest2/components/screensized.dart';
import 'package:quest2/pages/Phone/phonepage.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _initYoutubeController();
  }

  Future<void> _initYoutubeController() async {
    _youtubeController = YoutubePlayerController.fromVideoId(
      videoId: 'NMjhjrBIrG8',
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        mute: false,
      ),
    );

    // 컨트롤러가 준비될 때까지 대기
    await _youtubeController.playVideo();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _youtubeController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobile: PhonePage(youtubeController: _youtubeController),
        desktop: PageView(
          key: const PageStorageKey<String>('desktop_pageview'),
          controller: _pageController,
          scrollDirection: Axis.vertical,
          pageSnapping: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Desktop1(),
            Desktop2(),
            Desktop3(),
            Desktop4(),
            Desktop5(),
            Desktop6(),
            Desktop7(),
            Desktop8(),
            Desktop9(),
            Desktop10(
              pageController: _pageController,
            )
          ],
        ),
      ),
    );
  }
}
