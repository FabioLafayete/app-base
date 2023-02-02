import 'package:app/components/base_widget.dart';
import 'package:app/components/video_player_view.dart';
import 'package:app/modules/home/controller/home_controller.dart';
import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:video_player/video_player.dart';
import '../../../components/base_page.dart';
import '../../../shared/model/video/video_model.dart';


class HomePage extends BaseWidget<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navController = Get.find<NavController>();

    return controller.obx(
            (_) => BasePage(
              padding: 0,
              body: Center(
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          navController.setVideoSelected(
                            const VideoModel(
                              name: 'TESTE DE VIDEO',
                              url: 'assets/video/bike.mp4',
                              type: DataSourceType.asset
                            )
                          );
                          navController.miniplayerController.animateToHeight(state: PanelState.MAX);
                        },
                        child: Text('CLIQUE')
                    ),
                    ElevatedButton(
                        onPressed: (){
                          navController.setVideoSelected(null);
                        },
                        child: Text('SAIR')
                    ),
                  ],
                )
              ),
              backgroundColor: Colors.white,
            ),
    );
  }

  void showModal (){
    Get.bottomSheet(
      DraggableScrollableSheet(
        initialChildSize: 1.0,
        minChildSize: 0.3,
        maxChildSize: 1.0,
        expand: false,
        snap: true,
        builder: (_, controller){
          return Card(
            color: Colors.white,
            child: ListView(
              shrinkWrap: true,
              controller: controller,
              children: const [
                VideoPlayerView(
                  dataSourceType: DataSourceType.asset,
                  url: 'assets/video/drift.mp4',
                ),
              ],
            ),
          );
        },
      ),
      elevation: 16,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: false,
    );
  }

}

// void showModal (){
//   Get.bottomSheet(
//       SlidingUpPanel(
//         maxHeight: height,
//         panel: Card(
//           color: Colors.white,
//           child: VideoPlayerView(
//             dataSourceType: DataSourceType.network,
//             url: 'https://rr1---sn-bg0eznsk.googlevideo.com/videoplayback?expire=1675239369&ei=acvZY-SlE4PZgQew8ZrwAw&ip=23.88.39.196&id=o-ADQXmaQyHFFMxzOsulPtps2QEXLdze7kfA6n4WqP4kha&itag=18&source=youtube&requiressl=yes&spc=H3gIhpD7JFqL8zvDu9Y1KECa7Db-vGQ&vprv=1&svpuc=1&mime=video%2Fmp4&cnr=14&ratebypass=yes&dur=621.040&lmt=1664690590041825&fexp=24007246&c=ANDROID&txp=5538434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRgIhAOeNh_jojD3jBBX0Pdf1cty4aas4M1cc4Y6zPscY5zFvAiEA7GVIFCDVKwo44fp1QcRk4Z8frD_ErCsyEEOaakbL1XY%3D&rm=sn-4g5ekk7s&req_id=e0f45297b86da3ee&ipbypass=yes&redirect_counter=2&cm2rm=sn-oxunxg8pjvn-bg0z7r&cms_redirect=yes&cmsv=e&mh=vW&mip=2804:14c:1af:566d:1b2:60b7:5561:d914&mm=29&mn=sn-bg0eznsk&ms=rdu&mt=1675217610&mv=m&mvi=1&pl=45&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRAIgbPFAq9oRbk3cFzt3-LifHlpgoJi7CE4OpO-smH3xOT0CIE9CBNMycbm7m_W0-JnHFAlRN0rdEqaGbHRHzzWrYMTF',
//           ),
//         ),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       isScrollControlled: true,
//       isDismissible: false,
//       enableDrag: false
//   );
// }