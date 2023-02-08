import 'package:app/modules/home/page/home_page.dart';
import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';

import '../../../components/base_widget.dart';
import '../../../components/video_player_view.dart';

class NavPage extends BaseWidget<NavController> {

  NavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _screens = [
      HomePage(),
      const Scaffold(backgroundColor: Colors.red),
      const Scaffold(backgroundColor: Colors.white),
      const Scaffold(backgroundColor: Colors.green),
    ];

    return Obx(() => Scaffold(
      body: Stack(
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
            i,
            Offstage(
                offstage: controller.selectedIndex != i,
                child: screen
            )
        )).values.toList()..add(
            Offstage(
              offstage: controller.videoSelected == null,
              child: SafeArea(
                child: Miniplayer(
                minHeight: 80,
                backgroundColor: Colors.transparent,
                controller: controller.miniplayerController,
                maxHeight: height,
                builder: (heightPlayer, percentage){
                  controller.setPercentVideo(percentage);
                  if(controller.videoSelected == null) return const SizedBox.shrink();
                  return VideoPlayerView(
                      dataSourceType: controller.videoSelected!.type,
                      url: controller.videoSelected!.url
                  );
                })
              )
            )
        )
      ),
      backgroundColor: colors.background,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        iconSize: 25,
        backgroundColor: colors.background,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.textSecondary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i) => controller.setSelectedIndex(i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.utensils),
              activeIcon: Icon(FontAwesomeIcons.utensils),
              label: 'Alimentação'
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.dumbbell),
              activeIcon: Icon(FontAwesomeIcons.dumbbell),
              label: 'Treinos'
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.users),
              activeIcon: Icon(FontAwesomeIcons.users),
              label: 'Comunidade'
          )
        ],
      ),
    ));
  }
}
