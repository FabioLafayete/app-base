import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../components/app_theme_widget.dart';

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
  final text = AppTheme().text;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        setState(() {
          showControl = !showControl;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: size.width,
        height: size.height,
        color: showControl ? Colors.white.withOpacity(0.3) : Colors.transparent,
        child: showControl ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                text(
                    _formatDuration(widget.videoPlayerController.value.position),
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis
                ),
                text(
                    '/${_formatDuration(widget.videoPlayerController.value.duration)}',
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis
                ),
              ],
            )
          ],
        ) : const SizedBox.shrink(),
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