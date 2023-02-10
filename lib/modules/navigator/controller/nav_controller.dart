import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:video_player/video_player.dart';

import '../../../shared/model/video/video_model.dart';


class NavController extends GetxController with StateMixin {


  final RxInt _selectedIndex = RxInt(0);
  final RxDouble _percentVideo = RxDouble(0);
  final Rxn<Duration> _positionVideo = Rxn<Duration>();
  final Rxn<VideoModel> _videoSelected = Rxn<VideoModel>();
  final Rxn<ChewieController> _chewieController = Rxn<ChewieController>();
  final Rxn<VideoPlayerController> _videoPlayerController = Rxn<VideoPlayerController>();

  final MiniplayerController miniplayerController = MiniplayerController();

  NavController() : super() {
    changeStatus();
  }

  int get selectedIndex => _selectedIndex.value;
  double get percentVideo => _percentVideo.value;
  Duration? get positionVideo => _positionVideo.value;
  VideoModel? get videoSelected => _videoSelected.value;
  ChewieController? get chewieController => _chewieController.value;
  VideoPlayerController? get videoPlayerController => _videoPlayerController.value;

  setSelectedIndex(int value) => _selectedIndex.value = value;
  setPercentVideo(double value) => _percentVideo.value = value;
  setPositionVideo(Duration value) => _positionVideo.value = value;
  setVideoSelected(VideoModel? value) => _videoSelected.value = value;
  setChewieController(ChewieController? value) => _chewieController.value = value;
  setVideoPlayerController(VideoPlayerController? value) => _videoPlayerController.value = value;

  void changeStatus(){
    change(null, status: RxStatus.success());
  }

}