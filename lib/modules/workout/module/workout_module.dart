import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:app/modules/navigator/page/nav_page.dart';
import 'package:app/modules/workout/page/congrats_page.dart';
import 'package:app/modules/workout/page/workout_detail_page.dart';
import 'package:app/modules/workout/page/workout_video_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WorkoutModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) {
        Modular.get<NavController>().setPageSelected(0);
        return NavPage();
      },
    );
    r.child(
      '/video',
      child: (context) => const WorkoutVideoPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      '/detail',
      child: (context) =>  WorkoutDetailPage(),
    );
    r.child(
      '/congrats',
      child: (context) =>  CongratsPage(),
    );
  }
}