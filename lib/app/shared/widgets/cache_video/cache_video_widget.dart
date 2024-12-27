import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CacheVideoWidget extends StatefulWidget {
  const CacheVideoWidget({
    super.key,
    required this.videoUrl,
  });
  final String videoUrl;

  @override
  State<CacheVideoWidget> createState() => _CacheVideoWidgetState();
}

class _CacheVideoWidgetState extends State<CacheVideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }
}
