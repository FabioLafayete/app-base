import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/shared/widgets/app_theme_widget.dart';
import 'package:app/shared/widgets/back_button.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/util/colors.dart';
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
            _videoControl(),
          ],
        );
      }),
    );
  }

  Widget _loading() {
    return Container(
      height: height * 0.62,
      color: colors.primary,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: colors.background,
        ),
      ),
    );
  }

  Widget _video() {
    return SizedBox(
      height: height * 0.61,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        alignment: Alignment.center,
        child: SizedBox(
          // height: controller.videoPlayerController!.value.size.height,
          // width: controller.videoPlayerController!.value.size.width,
          height: height * 0.29,
          width: width,
          child: VideoPlayer(controller.videoPlayerController!)
        ),
      ),
    );
  }

  Widget _videoControl(){
    if(controller.videoPlayerController == null) {
      return const SizedBox.shrink();
    }
    return Positioned(
      bottom: 0, left: 0, right: 0,
      child: Container(
        height: height * 0.41,
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
            const SizedBox(height: 30),
            text(
              controller.workoutModel!.title,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
              fontSize: 30,
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
                      iconSize: 60,
                      color: colors.primary,
                    ),
                  )
                else
                  const SizedBox(width: 75),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
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
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                            controller.videoPlayerController!.value.isPlaying ?
                                Icons.pause_circle_filled_rounded :
                                Icons.play_circle_fill_rounded
                        ),
                        if(controller.positionVideo != null)
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: CircularProgressIndicator(
                              color: colors.background,
                              strokeWidth: 2,
                              value: controller.percentVideo,
                            ),
                          )
                      ],
                    ),
                    iconSize: 90,
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
                      iconSize: 60,
                      color: colors.primary,
                    ),
                  )
                else
                  const SizedBox(width: 75),
              ],
            ),
            SizedBox(height: height * 0.1)
          ],
        ),
      ),
    );
  }

  Future<void> initController({int index = 0}) async {
    controller.setCurrentIndexVideo(index);
    controller.setPositionVideo(Duration.zero);
    controller.videoPlayerController?.dispose();
    controller.setVideoPlayerController(null);

    controller.setVideoPlayerController(
        VideoPlayerController.networkUrl(
          Uri.parse(controller.workoutModel!.videoUrl),
        )
    );

    await controller.videoPlayerController!.initialize();

    controller.videoPlayerController!.setVolume(0);
    controller.videoPlayerController!.setLooping(true);
    controller.videoPlayerController!.play();
    setState(() {});
    controller.videoPlayerController!.addListener((){
      if(controller.videoPlayerController != null){
        controller.setPositionVideo(controller.videoPlayerController!.value.position);
      }
    });

  }

  void disposeVideo(){
    controller.setCurrentIndexVideo(0);
    controller.setPositionVideo(Duration.zero);
    controller.videoPlayerController?.dispose();
    controller.setVideoPlayerController(null);
  }

}
