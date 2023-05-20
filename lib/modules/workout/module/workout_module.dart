import 'package:app/modules/navigator/page/nav_page.dart';
import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WorkoutModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.factory((i) => WorkoutController())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
        '/',
        child: (context, args) => NavPage(index: 2)
    ),
  ];
}