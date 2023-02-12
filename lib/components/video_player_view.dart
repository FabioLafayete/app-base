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

  late NavController controller;
  bool showControl = true;

  AppColors colors = AppColors();
  final text = AppTheme().text;
  late Size size;
  late EdgeInsets padding;
  final videoKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = Get.find<NavController>();
    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        controller.setVideoPlayerController(VideoPlayerController.asset(widget.url));
        break;
      case DataSourceType.network:
        controller.setVideoPlayerController(VideoPlayerController.network(widget.url));
        break;
      case DataSourceType.file:
        controller.setVideoPlayerController(VideoPlayerController.file(File(widget.url)));
        break;
      case DataSourceType.contentUri:
        controller.setVideoPlayerController(VideoPlayerController.contentUri(Uri.parse(widget.url)));
        break;
    }

    controller.videoPlayerController!.initialize().then((_) {
              controller.setChewieController(ChewieController(
                videoPlayerController: controller.videoPlayerController!,
                aspectRatio: controller.videoPlayerController!.value.aspectRatio,
                showControls: true,
                showOptions: false,
                looping: true,
                autoPlay: true,
                customControls: const CustomControlView(),
                autoInitialize: true,
              ));
              controller.chewieController!.setVolume(0);
    });
    controller.videoPlayerController!.addListener(
            () => controller.setPositionVideo(controller.videoPlayerController!.value.position)
    );
    getHeightVideo();
  }

  @override
  void dispose() {
    controller.videoPlayerController?.dispose();
    controller.chewieController?.dispose();
    controller.setVideoPlayerController(null);
    controller.setChewieController(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    padding = MediaQuery.of(context).padding;

    print(Get.bottomBarHeight);
    print(Get.statusBarHeight);
    print(controller.heightPlayer);

    return Obx((){
      if(controller.chewieController == null) {
        return const Center(child: CircularProgressIndicator());
      }
      if(controller.percentVideo <= 0.5){
        return Column(
          children: [
            _video(false),
          ],
        );
      }
      return Container(
        height: size.height,
        color: Colors.pink,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _video(true),
            Expanded(
                child: ListView(
                  children: [
                    Container(color: Colors.red, width: size.width, height: size.height,),
                    SizedBox(height: 100,),
                    Container(color: Colors.grey, width: size.width, height: size.height,),
                  ],
                )
            )
          ],
        ),
      );
    });
  }

  Future getHeightVideo() async {
    if(mounted && videoKey.currentContext != null){
      if(videoKey.currentContext!.size != null){
        controller.setHeightPlayer(videoKey.currentContext!.size!.height);
      }
    }
    if(controller.heightPlayer == null){
      await Future.delayed(const Duration(milliseconds: 100));
      getHeightVideo();
    }
  }

  Widget _video(bool simpleVideo){
    if(simpleVideo){
      return Flexible(
        child: AspectRatio(
          key: videoKey,
          aspectRatio: controller.videoPlayerController!.value.aspectRatio,
          child: Chewie(controller: controller.chewieController!),
        ),
      );
    }
    return Flexible(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: AspectRatio(
                  aspectRatio: controller.videoPlayerController!.value.aspectRatio,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    text(
                        controller.videoSelected!.name,
                        maxLines: 1,
                        fontWeight: FontWeight.w700,
                        textOverflow: TextOverflow.ellipsis
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        text(
                            _formatDuration(controller.positionVideo ?? const Duration()),
                            maxLines: 1,
                            fontWeight: FontWeight.w700,
                            textOverflow: TextOverflow.ellipsis
                        ),
                        text(
                            '/${_formatDuration(controller.videoPlayerController!.value.duration)}',
                            maxLines: 1,
                            fontWeight: FontWeight.w700,
                            textOverflow: TextOverflow.ellipsis
                        ),
                      ],
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  if(controller.chewieController!.isPlaying){
                    controller.chewieController!.pause();
                  } else {
                    controller.chewieController!.play();
                  }
                  setState(() {});
                },
                icon: Icon(controller.chewieController!.isPlaying ? Icons.pause : Icons.play_arrow_rounded),
                color: colors.text,
              ),
              IconButton(
                onPressed: (){
                  controller.setVideoSelected(null);
                },
                icon: const Icon(Icons.close_sharp),
                color: colors.text,
              )
            ],
          ),
          AspectRatio(
            aspectRatio: controller.videoPlayerController!.value.aspectRatio,
            child: Chewie(controller: controller.chewieController!),
          ),
        ],
      ),
    );
  }


  String _formatDuration(Duration duration){
    if(duration.inHours >0) return duration.toString().split('.')[0].padLeft(8, '0');
    return duration.toString().split('.')[0].substring(3).padLeft(5, '0');
  }

}
