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
              backgroundColor: colors.background,
              body: Center(
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          navController.setVideoSelected(
                            const VideoModel(
                              name: 'TESTE DE VIDEO 1',
                              url: 'assets/video/video.mp4',
                              type: DataSourceType.asset
                            )
                          );
                          navController.miniplayerController.animateToHeight(state: PanelState.MAX);
                        },
                        child: Text('VIDEO 1')
                    ),
                    ElevatedButton(
                        onPressed: (){
                          navController.setVideoSelected(
                              const VideoModel(
                                  name: 'TESTE DE VIDEO 2',
                                  url: 'assets/video/video2.mp4',
                                  type: DataSourceType.asset
                              )
                          );
                          navController.miniplayerController.animateToHeight(state: PanelState.MAX);
                        },
                        child: Text('VIDEO 2')
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
            color: Colors.orange,
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