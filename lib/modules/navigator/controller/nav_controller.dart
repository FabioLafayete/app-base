import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';

import '../../../shared/model/video/video_model.dart';


class NavController extends GetxController with StateMixin {


  final RxInt _selectedIndex = RxInt(0);
  final Rxn<VideoModel> _videoSelected = Rxn<VideoModel>();

  final MiniplayerController miniplayerController = MiniplayerController();

  NavController() : super() {
    changeStatus();
  }

  int get selectedIndex => _selectedIndex.value;
  VideoModel? get videoSelected => _videoSelected.value;

  setSelectedIndex(int value) => _selectedIndex.value = value;
  setVideoSelected(VideoModel? value) => _videoSelected.value = value;

  void changeStatus(){
    change(null, status: RxStatus.success());
  }

}