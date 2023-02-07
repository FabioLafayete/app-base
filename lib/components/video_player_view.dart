import 'dart:io';

import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../modules/navigator/widget/custom_control_view.dart';
import '../util/colors.dart';
import 'app_theme_widget.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    Key? key,
    required this.dataSourceType,
    required this.url,
    this.mute = false,
    this.showController = true
  }) : super(key: key);

  final String url;
  final DataSourceType dataSourceType;
  final bool mute;
  final bool showController;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {

  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  late NavController controller;
  bool showControl = true;

  AppColors colors = AppColors();
  final text = AppTheme().text;
  late Size size;

  @override
  void initState() {
    super.initState();
    controller = Get.find<NavController>();
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
                showControls: true,
                showOptions: false,
                autoPlay: true,
                customControls: CustomControlView(videoPlayerController: _videoPlayerController),
                autoInitialize: true,
              );
              _chewieController!.setVolume(0);
            })
    );
    _videoPlayerController.addListener(() => setState((){}));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Container(
      color: colors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(_chewieController != null)
          Flexible(
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          text(
                              controller.videoSelected!.name,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis
                          ),
                          Row(
                            children: [
                              text(
                                  _formatDuration(_videoPlayerController.value.position),
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis
                              ),
                              text(
                                  '/${_formatDuration(_videoPlayerController.value.duration)}',
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if(_chewieController!.isPlaying){
                          _chewieController!.pause();
                        } else {
                          _chewieController!.play();
                        }
                        setState(() {});
                      },
                      icon: Icon(_chewieController!.isPlaying ? Icons.pause : Icons.play_arrow_rounded),
                      color: colors.text,
                    ),
                    IconButton(
                      onPressed: (){
                        controller.setVideoSelected(null);
                      },
                      icon: const Icon(Icons.close_rounded),
                      color: colors.text,
                    )
                  ],
                ),
                AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: Chewie(controller: _chewieController!),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  String _formatDuration(Duration duration){
    String hour = duration.inHours > 0 ? '${duration.inHours.toString().padLeft(2, '0')}:' : '';
    String minute = '${duration.inMinutes.toString().padLeft(2, '0')}:';
    String sec = duration.inSeconds.toString().padLeft(2, '0');
    return '$hour$minute$sec';
  }

}
