import 'package:app/modules/home/page/home_page.dart';
import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:rxdart/rxdart.dart';

import '../../../components/base_widget.dart';
import '../../../components/video_player_view.dart';
import '../../workout/page/workout_page.dart';

ValueNotifier currentlyPlaying = ValueNotifier(null);

class NavPage extends BaseWidget<NavController> {

  NavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    BehaviorSubject<double> percent = BehaviorSubject.seeded(0.0);

    final _screens = [
      HomePage(),
      const Scaffold(backgroundColor: Colors.red),
      WorkoutPage(),
      const Scaffold(backgroundColor: Colors.green),
    ];

    return Obx(() => WillPopScope(
      onWillPop: () async {
        if(controller.selectedIndex != 0){
          controller.setSelectedIndex(0);
          return false;
        }
        return true;
      },
      child: Scaffold(
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
                child: Miniplayer(
                minHeight: 80,
                backgroundColor: Colors.transparent,
                controller: controller.miniplayerController,
                maxHeight: Get.height,
                builder: (heightPlayer, percentage){
                  controller.setPercentVideo(percentage);
                  percent.add(percentage);
                  if(controller.videoSelected == null) return const SizedBox.shrink();
                  return VideoPlayerView(
                      dataSourceType: controller.videoSelected!.type,
                      url: controller.videoSelected!.url
                  );
                })
              )
          )
        ),
        backgroundColor: colors.background,
        bottomNavigationBar: StreamBuilder<double>(
          initialData: 0.0,
          stream: percent,
          builder: (_, snap){
            if(controller.percentVideo < 0.01 ) return _bottom();

            var opacity = (1 - controller.percentVideo) - 0.4;
            if (opacity < 0) opacity = 0;
            if (opacity > 1) opacity = 1;

            return Container(
              color: colors.background,
              height: (kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom) * (1 - controller.percentVideo),
              child: Transform.translate(
                offset: Offset(0.0, (kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom) * (controller.percentVideo * 0.5)),
                child: Opacity(
                  opacity: opacity,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [_bottom()],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }

  Widget _bottom(){
    return BottomNavigationBar(
      currentIndex: controller.selectedIndex,
      type: BottomNavigationBarType.fixed,
      elevation: 20,
      iconSize: 25,
      backgroundColor: colors.background,
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.textSecondary,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (i) => controller.setSelectedIndex(i),
      items: const [
        BottomNavigationBarItem(
            icon: FaIcon(LineIcons.home),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: FaIcon(LineIcons.utensils),
            label: 'Alimentação'
        ),
        BottomNavigationBarItem(
            icon: FaIcon(LineIcons.dumbbell),
            label: 'Treinos'
        ),
        BottomNavigationBarItem(
            icon: FaIcon(LineIcons.users),
            label: 'Comunidade'
        )
      ],
    );
  }

}
