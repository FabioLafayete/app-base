import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    Key? key,
    required this.dataSourceType,
    required this.url,
    this.mute = false
  }) : super(key: key);

  final String url;
  final DataSourceType dataSourceType;
  final bool mute;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {

  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController = VideoPlayerController.network(widget.url);
        break;
      case DataSourceType.file:
        _videoPlayerController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoPlayerController = VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
    }

    _videoPlayerController.initialize().then(
            (_) => setState((){
              _chewieController = ChewieController(
                videoPlayerController: _videoPlayerController,
                aspectRatio: _videoPlayerController.value.aspectRatio,
                autoPlay: true,
                autoInitialize: true,
              );
              _chewieController.setVolume(0);
            })
    );

  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _videoPlayerController.value.aspectRatio,
      child: Chewie(controller: _chewieController,),
    );
  }
}
