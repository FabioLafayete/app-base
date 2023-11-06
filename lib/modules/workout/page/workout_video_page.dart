import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/shared/widgets/app_theme_widget.dart';
import 'package:app/shared/widgets/back_button.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/util/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class WorkoutVideoPage extends StatefulWidget {
  const WorkoutVideoPage({
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
    controller = Modular.get<WorkoutController>();
    initController();
    super.initState();
  }

  @override
  void dispose() {
    disposeVideo();
    super.dispose();
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
            if(controller.videoPlayerController == null ||
                !controller.videoPlayerController!.value.isInitialized)
              _loading(),
            if(controller.videoPlayerController?.value.isInitialized ?? false)
              _video(),
            MyBackButton(),
            _videoControl()
          ],
        );
      }),
    );
  }

  Widget _loading() {
    return Container(
      height: height * 0.65,
      color: colors.primary,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(colors.background),
        ),
      ),
    );
  }

  Widget _video() {
    return SizedBox(
      height: height * 0.6,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        alignment: Alignment.center,
        child: SizedBox(
          height: controller.videoPlayerController!.value.size.height,
          width: controller.videoPlayerController!.value.size.width,
          child: VideoPlayer(controller.videoPlayerController!)
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
        height: height * 0.42,
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
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
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(controller.currentIndexVideo > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: IconButton(
                      onPressed: (){
                        initController(
                            index: controller.currentIndexVideo - 1
                        );
                      },
                      icon: const Icon(Icons.skip_previous_rounded),
                      iconSize: 40,
                      color: colors.primary,
                    ),
                  )
                else
                  const SizedBox(width: 56),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                    onPressed: (){
                        if(controller.videoPlayerController != null &&
                            controller.videoPlayerController!.value.isInitialized){
                          if(controller.videoPlayerController!.value.isPlaying){
                            controller.videoPlayerController!.pause();
                          } else {
                            controller.videoPlayerController!.play();
                          }
                          setState(() {});
                        }
                      },
                    icon: Icon(
                        controller.videoPlayerController!.value.isPlaying ?
                            Icons.pause_circle_filled_rounded :
                            Icons.play_circle_fill_rounded
                    ),
                    iconSize: 70,
                    color: colors.primary,
                  ),
                ),
                if(controller.currentIndexVideo < controller.programModel!.workouts.length - 1)
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: IconButton(
                      onPressed: (){
                        initController(
                          index: controller.currentIndexVideo + 1
                        );
                      },
                      icon: const Icon(Icons.skip_next_rounded),
                      iconSize: 40,
                      color: colors.primary,
                    ),
                  )
                else
                  const SizedBox(width: 56),
              ],
            ),
            SizedBox(height: height * 0.12)
          ],
        ),
      ),
    );
  }

  void initController({int index = 0}){
    controller.setCurrentIndexVideo(index);
    controller.setPositionVideo(Duration.zero);
    controller.videoPlayerController?.dispose();
    controller.setVideoPlayerController(null);

    controller.setVideoPlayerController(
        VideoPlayerController.networkUrl(
          Uri.parse(controller.workoutModel!.videoUrl),
        )
    );
    controller.videoPlayerController!.initialize().then((_) {
      controller.videoPlayerController!.setVolume(0);
      controller.videoPlayerController!.setLooping(true);
      controller.videoPlayerController!.play();
      setState(() {});
      controller.videoPlayerController!.addListener((){
        if(controller.videoPlayerController != null){
          controller.setPositionVideo(controller.videoPlayerController!.value.position);
        }
      });
    });

  }

  void disposeVideo(){
    controller.setCurrentIndexVideo(0);
    controller.setPositionVideo(Duration.zero);
    controller.videoPlayerController?.dispose();
    controller.setVideoPlayerController(null);
  }

}
