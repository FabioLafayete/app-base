import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:app/shared/modules/user/controller/user_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/video_player_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
import '../../food/page/food_page.dart';
import '../../profile/page/profile_page.dart';
import '../../workout/page/workout_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends ViewState<NavPage, NavController> {

  late dynamic tr;

  @override
  void initState() {
    super.initState();
    UserController userController = Modular.get<UserController>();
    userController.postLog();
  }

  @override
  Widget build(BuildContext context) {
    tr = local.tr['bottomNavigation'];
    final screens = [
      // HomePage(),
      const WorkoutPage(),
      FoodPage(),
      const ProfilePage(),
    ];

    return Observer(builder: (_) => WillPopScope(
      onWillPop: () async {
        if(controller.pageSelected != 0) {
          controller.setPageSelected(0);
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
                    offstage: controller.pageSelected != i,
                    child: screen
                )
            )).values.toList()..add(
                Offstage(
                    offstage: controller.videoSelected == null,
                    child: Miniplayer(
                        minHeight: 80,
                        backgroundColor: Colors.transparent,
                        controller: controller.miniplayerController,
                        maxHeight: height,
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

class _BottomNavState extends ViewState<BottomNav, NavController> {

  late dynamic tr;

  @override
  Widget build(BuildContext context) {
    tr = local.tr['bottomNavigation'];
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
              child: SuperListView(
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
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: controller.pageSelected,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: colors.background,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.textSecondary,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 11,
        onTap: (int value){
          HapticFeedback.lightImpact();
          controller.setPageSelected(value);
        },
        items: [
          // BottomNavigationBarItem(
          //     icon: FaIcon(LineIcons.home),
          //     label: 'Home'
          // ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/icon/svg/home-4.svg',
                colorFilter: ColorFilter.mode(colors.textSecondary, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/icon/svg/home-4.svg',
                colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
              ),
              label: tr['home']
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/icon/svg/cloche.svg',
                colorFilter: ColorFilter.mode(colors.textSecondary, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/icon/svg/cloche.svg',
                colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
              ),
              label: tr['recipes']
          ),
          // BottomNavigationBarItem(
          //     icon: FaIcon(LineIcons.users),
          //     label: 'Feed'
          // ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/icon/svg/user.svg',
                colorFilter: ColorFilter.mode(colors.textSecondary, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/icon/svg/user.svg',
                colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
              ),
              label: tr['profile']
          ),
        ],
      ),
    );
  }
}
