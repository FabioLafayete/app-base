import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:video_player/video_player.dart';

import '../../../components/app_theme_widget.dart';
import '../../../util/colors.dart';

class CustomControlView extends StatefulWidget {
  const CustomControlView({
    Key? key,
    required this.videoPlayerController
  }) : super(key: key);

  final VideoPlayerController videoPlayerController;

  @override
  State<CustomControlView> createState() => _CustomControlViewState();
}

class _CustomControlViewState extends State<CustomControlView> {

  late Size size;
  bool showControl = true;
  bool enableControl = true;
  final text = AppTheme().text;
  AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    widget.videoPlayerController.addListener(() => setState((){}));
    final controllerNav = Get.find<NavController>();
    return Obx((){
      if(controllerNav.percentVideo == 1) {
        enableControl = true;
      } else {
        enableControl = false;
        showControl = false;
      }
      return GestureDetector(
        onTap: (){
          if(enableControl) {
            setState(() {
              showControl = !showControl;
            });
          } else {
            controllerNav.miniplayerController.animateToHeight(state: PanelState.MAX);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: size.width,
          height: size.height,
          color: showControl ? Colors.black.withOpacity(0.5) : Colors.transparent,
          child: showControl ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      controllerNav.miniplayerController.animateToHeight(state: PanelState.MIN);
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.only(left: 5, top: 5),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(1000)
                      ),
                      child: Icon(Icons.keyboard_arrow_down_rounded, color: colors.textSecondary),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  text(
                      _formatDuration(widget.videoPlayerController.value.position),
                      maxLines: 1,
                      color: colors.text,
                      textOverflow: TextOverflow.ellipsis
                  ),
                  text('/${_formatDuration(widget.videoPlayerController.value.duration)}',
                      maxLines: 1,
                      color: colors.text.withOpacity(0.8),
                      textOverflow: TextOverflow.ellipsis
                  ),
                ],
              ),
            ],
          ) : const SizedBox.shrink(),
        ),
      );
    });
  }

  String _formatDuration(Duration duration){
    if(duration.inHours >0) return duration.toString().split('.')[0].padLeft(8, '0');
    return duration.toString().split('.')[0].substring(3).padLeft(5, '0');
  }
}