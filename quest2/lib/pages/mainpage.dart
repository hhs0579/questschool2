import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quest2/components/screensized.dart';
import 'package:quest2/pages/Desktop/desktop1.dart';
import 'package:quest2/pages/Desktop/desktop2.dart';
import 'package:quest2/pages/Desktop/desktop3.dart';
import 'package:quest2/pages/Desktop/desktop4.dart';
import 'package:quest2/pages/Desktop/desktop5.dart';
import 'package:quest2/pages/Desktop/desktop6.dart';
import 'package:quest2/pages/Desktop/desktop7.dart';
import 'package:quest2/pages/Desktop/desktoppage.dart';
import 'package:quest2/pages/Phone/phonepage.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController.fromVideoId(
      videoId: '2o1Jdbs9Ll4',
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          mobile: PhonePage(youtubeController: _youtubeController),
          //  PhonePage(youtubeController: _youtubeController),
          desktop: DesktopPage(youtubeController: _youtubeController)),
    );
  }
}
