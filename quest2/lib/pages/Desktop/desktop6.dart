import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest2/components/color.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Desktop6 extends StatefulWidget {
  final PageController pageController;
  const Desktop6({
    super.key,
    required this.pageController,
  });

  @override
  State<Desktop6> createState() => _Desktop6State();
}

class _Desktop6State extends State<Desktop6>
    with AutomaticKeepAliveClientMixin {
  late YoutubePlayerController _controller;
  bool _isInView = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _loadVideo();
  }

  void _loadVideo() {
    _controller.loadVideoById(
      videoId: 'NMjhjrBIrG8',
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void _handleVisibilityChange() {
    if (!mounted) return;

    final renderObject = context.findRenderObject();
    if (renderObject == null) return;

    final RenderBox box = renderObject as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    final Size size = box.size;

    final screenHeight = MediaQuery.of(context).size.height;
    final isVisible =
        position.dy < screenHeight && position.dy + size.height > 0;

    if (isVisible != _isInView) {
      setState(() {
        _isInView = isVisible;
      });
      if (!isVisible) {
        _controller.pauseVideo();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/back1.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  width: double.infinity, // 추가: 전체 너비 사용
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // 이미 있음
                    mainAxisAlignment: MainAxisAlignment.start, // 추가: 세로 정렬
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 36,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: '퀘스트스쿨',
                              style: TextStyle(color: AppColor.font1),
                            ),
                            TextSpan(
                              text: '의 홍보용 영상',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: YoutubePlayer(
                          controller: _controller,
                          aspectRatio: 16 / 9,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
