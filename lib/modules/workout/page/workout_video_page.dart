import 'dart:async';

import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/route/my_router.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/widgets/back_button.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:video_player/video_player.dart';

class WorkoutVideoPage extends StatefulWidget {
  const WorkoutVideoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<WorkoutVideoPage> createState() => _WorkoutVideoPageState();
}

class _WorkoutVideoPageState
    extends ViewState<WorkoutVideoPage, WorkoutController> {
  bool hasInitialize = false;

  Timer? _timer;
  int _start = 3;

  late dynamic tr;

  @override
  void initState() {
    initController();
    controller.setShowCountdown(true);
    super.initState();
  }

  @override
  void dispose() {
    disposeVideo();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tr = local.tr['workout']['videoWorkout'];
    return BasePage(
      backgroundColor: colors.background,
      showAppBar: false,
      paddingPage: 0,
      extendBodyBehindAppBar: false,
      body: Observer(builder: (_) {
        return Stack(
          children: [
            SizedBox(height: height),
            if (controller.state.videoPlayerController == null ||
                !controller.state.videoPlayerController!.value.isInitialized)
              _loading(),
            if (controller.state.videoPlayerController?.value.isInitialized ??
                false)
              _video(),
            _appBar(),
            _videoControl(),
            _outWorkout(),
            _countDown()
          ],
        );
      }),
    );
  }

  Widget _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyBackButton(
          onPress: () {
            controller.setOutWorkout(true);
            if (controller.state.videoPlayerController != null &&
                controller.state.videoPlayerController!.value.isInitialized) {
              if (controller.state.videoPlayerController!.value.isPlaying) {
                controller.state.videoPlayerController!.pause();
                // setState(() {});
              }
            }
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 30, right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: colors.text.withOpacity(0.6)),
          child: text(
              '${controller.state.currentIndexVideo + 1} / ${controller.state.programModel?.workouts.length}',
              color: colors.text2,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  void startTimer() {
    const period = Duration(seconds: 1);
    HapticFeedback.lightImpact();
    _timer = Timer.periodic(
      period,
      (Timer timer) {
        if (_start == 1) {
          HapticFeedback.lightImpact();
          controller.setShowCountdown(false);
          if (hasInitialize) {
            controller.state.videoPlayerController!.play();
          }
          timer.cancel();
        } else {
          HapticFeedback.lightImpact();
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Widget _countDown() {
    if (!controller.state.showCountdown) return const SizedBox.shrink();
    if (!(_timer?.isActive ?? false)) {
      _start = 3;
      startTimer();
    }
    return Container(
      color: colors.primary.withOpacity(0.85),
      child: Center(
        child: text('$_start',
            color: colors.text2, fontSize: 100, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _outWorkout() {
    if (controller.state.showOutWorkout) {
      return Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              colors.background.withOpacity(0.4),
              colors.background,
            ],
            stops: const [0.01, 0.6],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            text('💪', fontSize: 60),
            const SizedBox(height: 20),
            text(tr['stayStrong'], fontSize: 30, fontWeight: FontWeight.w600),
            const SizedBox(height: 10),
            text(tr['youCanDoIt'], fontSize: 30, fontWeight: FontWeight.w600),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyButton(
                title: tr['button'],
                heightButton: 55,
                sizeTitle: 20,
                colorTitle: colors.background,
                onPress: () {
                  controller.setOutWorkout(false);
                  if (controller.state.videoPlayerController != null &&
                      controller
                          .state.videoPlayerController!.value.isInitialized) {
                    if (!controller
                        .state.videoPlayerController!.value.isPlaying) {
                      controller.state.videoPlayerController!.play();
                      setState(() {});
                    }
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            MyButton(
              title: tr['finishWorkout'],
              colorTitle: colors.text.withOpacity(0.6),
              sizeTitle: 18,
              cleanButton: true,
              onPress: () {
                MyRouter().pop();
                controller.setOutWorkout(false);
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
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
      height: height * 0.6,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        alignment: Alignment.center,
        child: SizedBox(
          height: height * 0.28,
          width: width,
          child: VideoPlayer(controller.state.videoPlayerController!),
        ),
      ),
    );
  }

  Widget _videoControl() {
    if (controller.state.videoPlayerController == null) {
      return const SizedBox.shrink();
    }
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: height * 0.41,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: height * 0.05),
            text(
              controller.workoutModel!.title,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (controller.state.currentIndexVideo > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: IconButton(
                      onPressed: () {
                        initController(
                            index: controller.state.currentIndexVideo - 1);
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
                    onPressed: () {
                      if (controller.state.videoPlayerController != null &&
                          controller.state.videoPlayerController!.value
                              .isInitialized) {
                        if (controller
                            .state.videoPlayerController!.value.isPlaying) {
                          controller.state.videoPlayerController!.pause();
                        } else {
                          controller.state.videoPlayerController!.play();
                        }
                        setState(() {});
                      }
                    },
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          controller
                                  .state.videoPlayerController!.value.isPlaying
                              ? Icons.pause_circle_filled_rounded
                              : Icons.play_circle_fill_rounded,
                        ),
                        if (controller.state.positionVideo != null)
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: TweenAnimationBuilder<double>(
                              tween:
                                  Tween(begin: 0, end: controller.percentVideo),
                              duration: const Duration(milliseconds: 500),
                              builder: (context, value, _) =>
                                  CircularProgressIndicator(
                                color: colors.background,
                                strokeWidth: 2,
                                value: value,
                              ),
                            ),
                          ),
                      ],
                    ),
                    iconSize: 90,
                    color: colors.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: IconButton(
                    onPressed: () {
                      if (controller.state.currentIndexVideo <
                          controller.state.programModel!.workouts.length - 1) {
                        initController(
                          index: controller.state.currentIndexVideo + 1,
                        );
                        controller.setShowCountdown(true);
                      } else {
                        router.pushNamedAndRemoveUntil(
                          PagesNames.workoutCongrats,
                        );
                      }
                    },
                    icon: const Icon(Icons.skip_next_rounded),
                    iconSize: 60,
                    color: colors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.12),
          ],
        ),
      ),
    );
  }

  Future<void> initController({int index = 0}) async {
    bool isPrevious = index < controller.state.currentIndexVideo;
    hasInitialize = false;
    controller.setCurrentIndexVideo(index);
    controller.setPositionVideo(Duration.zero);
    controller.state.videoPlayerController?.dispose();
    controller.setVideoPlayerController(null);

    controller.setVideoPlayerController(VideoPlayerController.networkUrl(
        Uri.parse(controller.workoutModel!.videoUrl)));

    controller.state.videoPlayerController!.setVolume(0);
    controller.state.videoPlayerController!.setLooping(true);
    await controller.state.videoPlayerController!.setPlaybackSpeed(1.0);

    await controller.state.videoPlayerController!.initialize();
    if (!isPrevious) {
      hasInitialize = true;
    }

    if (!(_timer?.isActive ?? false)) {
      controller.state.videoPlayerController!.play();
    }
    controller.state.videoPlayerController!.addListener(() {
      if (controller.state.videoPlayerController != null) {
        if (hasInitialize == false && isPrevious) {
          hasInitialize = true;
          setState(() {});
        }
        controller.setPositionVideo(
            controller.state.videoPlayerController!.value.position);
      }
    });
  }

  void disposeVideo() {
    controller.setCurrentIndexVideo(0);
    controller.setPositionVideo(Duration.zero);
    controller.state.videoPlayerController?.dispose();
    controller.setVideoPlayerController(null);
  }
}
