import 'package:chewie/chewie.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

import '../../../shared/model/video/video_model.dart';

part 'nav_controller.g.dart';

class NavController = NavControllerBase with _$NavController;

abstract class NavControllerBase with Store {

  @observable
  int? selectedIndex;
  @observable
  bool showControl = true;
  @observable
  bool isFullScreen = false;
  @observable
  bool showProgress = false;
  @observable
  bool enableMore10Seconds = false;
  @observable
  bool enableLess10Seconds = false;
  @observable
  double percentVideo = 0;
  @observable
  double? heightPlayer;
  @observable
  Duration? positionVideo;
  @observable
  VideoModel? videoSelected;
  @observable
  ChewieController? chewieController;
  @observable
  VideoPlayerController? videoPlayerController;

  final MiniplayerController miniplayerController = MiniplayerController();
  BehaviorSubject<double> percent = BehaviorSubject.seeded(0.0);

  NavControllerBase();

  @action
  setSelectedIndex(int? value) => selectedIndex = value;
  @action
  setShowControl(bool value) => showControl = value;
  @action
  setIsFullScreen(bool value) => isFullScreen = value;
  @action
  setShowProgress(bool value) => showProgress = value;
  @action
  setEnableMore10Seconds(bool value) => enableMore10Seconds = value;
  @action
  setEnableLess10Seconds(bool value) => enableLess10Seconds = value;
  @action
  setPercentVideo(double value) => percentVideo = value;
  @action
  setHeightPlayer(double? value) => heightPlayer = value;
  @action
  setPositionVideo(Duration value) => positionVideo = value;
  @action
  Future setVideoSelected(VideoModel? value) async {
    if(value == null) {
      videoSelected = value;
      return;
    }
    videoSelected = null;
    await Future.delayed(const Duration(milliseconds: 100));
    videoSelected = value;
  }
  @action
  setChewieController(ChewieController? value) => chewieController = value;
  @action
  setVideoPlayerController(VideoPlayerController? value) => videoPlayerController = value;

}