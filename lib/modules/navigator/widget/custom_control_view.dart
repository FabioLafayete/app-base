import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import '../../../components/app_theme_widget.dart';
import '../../../util/colors.dart';

class CustomControlView extends StatefulWidget {
  const CustomControlView({
    Key? key,
  }) : super(key: key);


  @override
  State<CustomControlView> createState() => _CustomControlViewState();
}

class _CustomControlViewState extends State<CustomControlView> with SingleTickerProviderStateMixin{

  late Size size;
  late AnimationController animationController;
  bool showControl = true;
  bool enableControl = true;
  bool turnOffControl = false;
  bool enableMore10Seconds = false;
  bool enableLess10Seconds = false;
  final text = AppTheme().text;
  AppColors colors = AppColors();
  final controllerNav = Get.find<NavController>();

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Obx((){
      if(controllerNav.percentVideo == 1) {
        enableControl = true;
      } else {
        enableControl = false;
        showControl = false;
      }

      if(controllerNav.chewieController!.isPlaying){
        if(animationController.status == AnimationStatus.completed) {
          animationController.animateBack(0);
          turnOffControl = false;
        }
      } else {
        if(animationController.status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      }

      return Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: size.width,
            height: size.height,
            color: showControl ? Colors.black.withOpacity(0.5) : Colors.transparent,
          ),
          GestureDetector(
            onDoubleTap: (){
              _enableSeconds(false);
              controllerNav.chewieController!
                  .seekTo(Duration(seconds: controllerNav.videoPlayerController!.value.position.inSeconds - 10));
              if(!controllerNav.chewieController!.isPlaying){
                controllerNav.chewieController!.play();
              }
            },
            onTap: (){
              if(enableControl) {
                setState(() {
                  showControl = !showControl;
                });
                if(showControl){
                  turnOffControl = false;
                  _closeControlAfterPlaying();
                }
              } else {
                controllerNav.miniplayerController.animateToHeight(state: PanelState.MAX);
              }
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: size.width * 0.5,
                color: Colors.transparent,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: enableLess10Seconds ? 1.0 : 0.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.keyboard_double_arrow_left_rounded, size: 50, color: Colors.white),
                      text('10 segundos', fontWeight: FontWeight.w500, color: Colors.white, fontSize: 12)
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onDoubleTap: (){
              _enableSeconds(true);
              controllerNav.chewieController!
                  .seekTo(Duration(seconds: controllerNav.videoPlayerController!.value.position.inSeconds + 10));
              if(!controllerNav.chewieController!.isPlaying){
                controllerNav.chewieController!.play();
              }
            },
            onTap: (){
              if(enableControl) {
                setState(() {
                  showControl = !showControl;
                });
                if(showControl){
                  turnOffControl = false;
                  _closeControlAfterPlaying();
                }
              } else {
                controllerNav.miniplayerController.animateToHeight(state: PanelState.MAX);
              }
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: size.width * 0.5,
                color: Colors.transparent,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: enableMore10Seconds ? 1.0 : 0.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.keyboard_double_arrow_right_rounded, size: 50, color: Colors.white),
                      text('10 segundos', fontWeight: FontWeight.w500, color: Colors.white, fontSize: 12)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: showControl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !controllerNav.chewieController!.isFullScreen,
                      child: GestureDetector(
                        onTap: (){
                          controllerNav.miniplayerController.animateToHeight(state: PanelState.MIN);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          margin: const EdgeInsets.only(left: 5, top: 5),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(1000)
                          ),
                          child: Icon(Icons.keyboard_arrow_down_rounded, color: colors.textSecondary),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // IconButton(
                      //     onPressed: (){
                      //
                      //     },
                      //     icon: const Icon(
                      //       Icons.replay_outlined,
                      //       size: 45,
                      //       color: Colors.white,
                      //     )
                      // ),
                      IconButton(
                          onPressed: (){
                            if(animationController.status == AnimationStatus.dismissed){
                              animationController.forward();
                              controllerNav.chewieController!.pause();
                            } else {
                              animationController.animateBack(0);
                              controllerNav.chewieController!.play();
                              turnOffControl = false;
                              _closeControlAfterPlaying();
                            }
                          },
                          icon: AnimatedIcon(
                            icon: AnimatedIcons.pause_play,
                            progress: animationController,
                            size: 50,
                            color: Colors.white,
                          )
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10),
                      //   child: IconButton(
                      //       onPressed: (){
                      //
                      //       },
                      //       icon: Transform(
                      //         alignment: Alignment.center,
                      //         transform: Matrix4.rotationY(math.pi),
                      //         child: const Icon(
                      //           Icons.replay_outlined,
                      //           size: 45,
                      //           color: Colors.white,
                      //         ),
                      //       )
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          text(
                              _formatDuration(controllerNav.positionVideo ?? const Duration()),
                              maxLines: 1,
                              color: colors.text,
                              textOverflow: TextOverflow.ellipsis
                          ),
                          text('/${_formatDuration(controllerNav.videoPlayerController!.value.duration)}',
                              maxLines: 1,
                              color: colors.text.withOpacity(0.8),
                              textOverflow: TextOverflow.ellipsis
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          if(controllerNav.chewieController!.isFullScreen){
                            controllerNav.chewieController!.exitFullScreen();
                            SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
                          } else {
                            controllerNav.chewieController!.enterFullScreen();
                          }

                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          margin: const EdgeInsets.only(left: 5, top: 5),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(1000)
                          ),
                          child: Icon(controllerNav.chewieController!.isFullScreen ?
                          Icons.fullscreen_exit :
                          Icons.fullscreen, color: colors.textSecondary),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Future<void> _closeControlAfterPlaying() async {
    return;
    turnOffControl = true;
    await Future.delayed(const Duration(seconds: 3));
    if(showControl && enableControl && turnOffControl){
      if(controllerNav.chewieController!.isPlaying){
        setState(() {
          showControl = false;
        });
      }
    }
  }

  Future<void> _enableSeconds(bool moreSeconds) async {
    if(moreSeconds){
      setState(() => enableMore10Seconds = true);
    } else {
      setState(() => enableLess10Seconds = true);
    }
    await Future.delayed(const Duration(seconds: 1));
    if(moreSeconds){
      setState(() => enableMore10Seconds = false);
    } else {
      setState(() => enableLess10Seconds = false);
    }
  }

  String _formatDuration(Duration duration){
    if(duration.inHours >0) return duration.toString().split('.')[0].padLeft(8, '0');
    return duration.toString().split('.')[0].substring(3).padLeft(5, '0');
  }
}