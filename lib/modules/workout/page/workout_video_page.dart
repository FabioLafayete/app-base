import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/shared/widgets/app_theme_widget.dart';
import 'package:app/shared/widgets/back_button.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/util/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class WorkoutVideoPage extends StatefulWidget {
  WorkoutVideoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<WorkoutVideoPage> createState() => _WorkoutVideoPageState();
}

class _WorkoutVideoPageState extends State<WorkoutVideoPage> {

  late WorkoutController controller;

  AppColors colors = AppColors();
  final text = AppTheme().text;

  final double width = Get.width;
  final double height = Get.height;

  @override
  void initState() {
    super.initState();
    controller = Modular.get<WorkoutController>();
    initController();
  }

  @override
  void dispose() {
    controller.videoPlayerController?.dispose();
    controller.chewieController?.dispose();
    controller.setVideoPlayerController(null);
    controller.setChewieController(null);
  }

  @override
  Widget build(BuildContext context) {

    return BasePage(
      backgroundColor: colors.background,
      showAppBar: false,
      paddingPage: 0,
      extendBodyBehindAppBar: false,
      body: Observer(builder: (_){
        return Stack(
          children: [
            SizedBox(height: height),
            _image(),
            if(controller.chewieController != null)
              _video(),
            if(controller.chewieController == null)
              const Center(child: CircularProgressIndicator()),
            MyBackButton(),
            _videoControl()
          ],
        );
      }),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 300),
      imageUrl: controller.programModel!.thumbnail,
      width: width,
      height: height * 0.65,
      fit: BoxFit.cover,
    );
  }

  Widget _video() {
    return SizedBox(
      height: height * 0.64,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          height: 1,
          child: Chewie(controller: controller.chewieController!),
        ),
      ),
    );
  }

  Widget _videoControl(){
    if(controller.workoutModel == null) {
      return const SizedBox.shrink();
    }
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: height * 0.37,
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            text(
              controller.workoutModel!.title,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: (){
                  initController(
                    index: controller.currentIndexVideo + 1
                  );
                },
                child: const Text('PLAY / PAUSE')
            )
          ],
        ),
      ),
    );
  }

  void initController({int index = 0}){
    controller.setCurrentIndexVideo(index);
    controller.setVideoPlayerController(
        VideoPlayerController.networkUrl(Uri.parse(controller.workoutModel!.videoUrl))
    );
    controller.videoPlayerController!.initialize().then((_) {
      controller.setChewieController(ChewieController(
        videoPlayerController: controller.videoPlayerController!,
        // aspectRatio: controller.videoPlayerController!.value.aspectRatio,
        aspectRatio: 9 / 6,
        showControls: false,
        showOptions: false,
        looping: true,
        autoPlay: true,
        autoInitialize: true,
      ));
      controller.chewieController!.setVolume(0);
      controller.videoPlayerController!.addListener(
              () => controller.setPositionVideo(controller.videoPlayerController!.value.position)
      );
    });
  }

}
