import 'package:app/modules/home/page/home_page.dart';
import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/video_player_view.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:miniplayer/miniplayer.dart';
import '../../food/page/food_page.dart';
import '../../profile/page/profile_page.dart';
import '../../workout/page/workout_page.dart';

class NavPage extends BaseWidget<NavController> {
  NavPage({Key? key, this.index = 0}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    if(controller.selectedIndex == null) {
      controller.setSelectedIndex(index);
    }
    final screens = [
      HomePage(),
      FoodPage(),
      WorkoutPage(),
      // const Scaffold(backgroundColor: Colors.green),
      ProfilePage(),
    ];

    return Observer(builder: (_) => WillPopScope(
      onWillPop: () async {
        if(controller.selectedIndex != 0) {
          controller.setSelectedIndex(0);
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Stack(
            children: screens
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
                          controller.percent.add(percentage);
                          if(controller.videoSelected == null) return const SizedBox.shrink();
                          return VideoPlayerView(
                              dataSourceType: controller.videoSelected!.type,
                              url: controller.videoSelected!.url
                          );
                        })
                )
            )
        ),
        backgroundColor: colors.text,
        bottomNavigationBar: const BottomNav(),
      ),
    ));
  }
}


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  final controller = Modular.get<NavController>();
  final colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      initialData: 0.0,
      stream: controller.percent,
      builder: (_, snap){
        double percentage = snap.data!;
        var opacity = (1 - percentage) - (percentage == 0 ? 0 : (percentage + 0.1));
        if (opacity < 0) opacity = 0;
        if (opacity > 1) opacity = 1;

        return Container(
          color: colors.background,
          height: (kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom + 3) * (1 - percentage),
          child: Transform.translate(
            offset: Offset(0.0, (kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom + 3) * (percentage * 0.2)),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: opacity,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [_bottom()],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _bottom(){
    return BottomNavigationBar(
      currentIndex: controller.selectedIndex!,
      type: BottomNavigationBarType.fixed,
      elevation: 5,
      backgroundColor: Colors.white,
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.textSecondary,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      onTap: (int value){
        HapticFeedback.lightImpact();
        controller.setSelectedIndex(value);
      },
      items: const [
        BottomNavigationBarItem(
            icon: FaIcon(LineIcons.home),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: FaIcon(LineIcons.fruitApple),
            label: 'Receitas'
        ),
        BottomNavigationBarItem(
            icon: FaIcon(LineIcons.dumbbell),
            label: 'Treinos'
        ),
        // BottomNavigationBarItem(
        //     icon: FaIcon(LineIcons.users),
        //     label: 'Feed'
        // ),
        BottomNavigationBarItem(
            icon: FaIcon(LineIcons.user),
            label: 'Perfil'
        )
      ],
    );
  }
}
