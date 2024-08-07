import 'dart:io';

import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
import 'package:video_player/video_player.dart';
import '../../modules/navigator/widget/custom_control_view.dart';
import '../../util/colors.dart';
import 'app_theme_widget.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    Key? key,
    required this.dataSourceType,
    required this.url,
    this.mute = false,
  }) : super(key: key);

  final String url;
  final DataSourceType dataSourceType;
  final bool mute;

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

  @override
  void initState() {
    super.initState();
    controller = Modular.get<NavController>();
    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        controller.setVideoPlayerController(VideoPlayerController.asset(widget.url));
        break;
      case DataSourceType.network:
        controller.setVideoPlayerController(VideoPlayerController.networkUrl(
          Uri.parse(widget.url)
        ));
        break;
      case DataSourceType.file:
        controller.setVideoPlayerController(VideoPlayerController.file(File(widget.url)));
        break;
      case DataSourceType.contentUri:
        controller.setVideoPlayerController(VideoPlayerController.contentUri(Uri.parse(widget.url)));
        break;
    }
    bool wasFullScreen = false;
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
              controller.chewieController?.addListener(() {
                final isFullScreen = controller.chewieController?.isFullScreen;
                if (wasFullScreen == true && isFullScreen == false) {
                  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
                  Future.delayed(const Duration(seconds: 1)).then((_) =>
                      SystemChrome.setPreferredOrientations(DeviceOrientation.values));
                }
                wasFullScreen = isFullScreen ?? false;
              });
              controller.videoPlayerController!.addListener(
                      () => controller.setPositionVideo(controller.videoPlayerController!.value.position)
              );
    });
  }

  @override
  void dispose() {
    if(!controller.isFullScreen){
      super.dispose();
      controller.videoPlayerController?.dispose();
      controller.chewieController?.dispose();
      controller.setVideoPlayerController(null);
      controller.setChewieController(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    padding = MediaQuery.of(context).padding;

    return Observer(builder: (_){
      if(controller.videoSelected == null) return const SizedBox.shrink();

      if(controller.chewieController == null) {
        return const Center(child: CircularProgressIndicator());
      }

      if(controller.isFullScreen){
        return Container(color: Colors.black,child: _video(true));
      }

      if(controller.percentVideo <= 0.3){
        return Column(
          children: [
            _video(false),
          ],
        );
      }
      return AnimatedContainer(
        color: colors.background,
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(top: controller.percentVideo > 0.8 ? MediaQuery.of(context).padding.top : 0),
        child: Column(
          children: [
            _video(true),
            Expanded(
              child: GestureDetector(
                onTap: (){},
                child: Opacity(
                  opacity: controller.percentVideo == 1 ? controller.percentVideo : (
                      controller.percentVideo - 0.3 <= 0 ? 0 : controller.percentVideo - 0.3
                  ),
                  child: SuperListView(
                    padding: EdgeInsets.zero,
                    children: List.generate(10, (index) =>
                        Container(margin: const EdgeInsets.all(10),
                          color: colors.secondary.withOpacity(0.9),
                          width: size.width, height: 200,)
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _video(bool simpleVideo){
    if(simpleVideo){
      return AspectRatio(
        aspectRatio: controller.chewieController!.videoPlayerController.value.aspectRatio,
        child: Chewie(controller: controller.chewieController!),
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
                  aspectRatio: controller.chewieController!.videoPlayerController.value.aspectRatio,
                ),
              ),
              const SizedBox(width: 10),
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
