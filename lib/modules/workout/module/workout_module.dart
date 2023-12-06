import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:app/modules/navigator/page/nav_page.dart';
import 'package:app/modules/workout/page/congrats_page.dart';
import 'package:app/modules/workout/page/workout_detail_page.dart';
import 'package:app/modules/workout/page/workout_video_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WorkoutModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      '/',
      child: (context, args) {
        Modular.get<NavController>().setSelectedIndex(2);
        return NavPage();
      },
    ),
    ChildRoute(
      '/video',
      child: (context, args) => const WorkoutVideoPage(),
      transition: TransitionType.noTransition,
    ),
    ChildRoute(
      '/detail',
      child: (context, args) =>  WorkoutDetailPage(),
    ),
    ChildRoute(
      '/congrats',
      child: (context, args) =>  CongratsPage(),
    ),
  ];
}