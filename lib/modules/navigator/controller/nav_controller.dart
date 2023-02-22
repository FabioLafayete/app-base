import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

import '../../../shared/model/video/video_model.dart';


class NavController extends GetxController with StateMixin {


  final Rxn<int> _selectedIndex = Rxn<int>();
  final RxBool _showControl = RxBool(true);
  final RxBool _isFullScreen = RxBool(false);
  final RxBool _showProgress = RxBool(false);
  final RxBool _enableMore10Seconds = RxBool(false);
  final RxBool _enableLess10Seconds = RxBool(false);
  final RxDouble _percentVideo = RxDouble(0);
  final Rxn<double> _heightPlayer = Rxn<double>();
  final Rxn<Duration> _positionVideo = Rxn<Duration>();
  final Rxn<VideoModel> _videoSelected = Rxn<VideoModel>();
  final Rxn<ChewieController> _chewieController = Rxn<ChewieController>();
  final Rxn<VideoPlayerController> _videoPlayerController = Rxn<VideoPlayerController>();

  final MiniplayerController miniplayerController = MiniplayerController();
  BehaviorSubject<double> percent = BehaviorSubject.seeded(0.0);

  NavController() : super() {
    changeStatus();
    // setSelectedIndex(2);
  }

  int? get selectedIndex => _selectedIndex.value;
  bool get showControl => _showControl.value;
  bool get isFullScreen => _isFullScreen.value;
  bool get showProgress => _showProgress.value;
  bool get enableMore10Seconds => _enableMore10Seconds.value;
  bool get enableLess10Seconds => _enableLess10Seconds.value;
  double get percentVideo => _percentVideo.value;
  double? get heightPlayer => _heightPlayer.value;
  Duration? get positionVideo => _positionVideo.value;
  VideoModel? get videoSelected => _videoSelected.value;
  ChewieController? get chewieController => _chewieController.value;
  VideoPlayerController? get videoPlayerController => _videoPlayerController.value;

  setSelectedIndex(int? value) => _selectedIndex.value = value;
  setShowControl(bool value) => _showControl.value = value;
  setIsFullScreen(bool value) => _isFullScreen.value = value;
  setShowProgress(bool value) => _showProgress.value = value;
  setEnableMore10Seconds(bool value) => _enableMore10Seconds.value = value;
  setEnableLess10Seconds(bool value) => _enableLess10Seconds.value = value;
  setPercentVideo(double value) => _percentVideo.value = value;
  setHeightPlayer(double? value) => _heightPlayer.value = value;
  setPositionVideo(Duration value) => _positionVideo.value = value;
  Future setVideoSelected(VideoModel? value) async {
    if(value == null) {
      _videoSelected.value = value;
      return;
    }
    _videoSelected.value = null;
    await Future.delayed(const Duration(milliseconds: 100));
    _videoSelected.value = value;
  }
  setChewieController(ChewieController? value) => _chewieController.value = value;
  setVideoPlayerController(VideoPlayerController? value) => _videoPlayerController.value = value;

  void changeStatus(){
    change(null, status: RxStatus.success());

    if(Get.arguments != null){
      if(Get.arguments.contains('index')){
        setSelectedIndex(Get.arguments['index']);
      }
    }

  }

}