import 'package:app/components/base_widget.dart';
import 'package:app/modules/home/controller/home_controller.dart';
import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:video_player/video_player.dart';
import '../../../components/base_page.dart';
import '../../../route/pages_name.dart';
import '../../../shared/model/video/video_model.dart';


class HomePage extends BaseWidget<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final navController = Modular.get<NavController>();
  static const router = '${PagesNames.home}/';

  @override
  Widget build(BuildContext context) {

    return BasePage(
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
    );
  }
}