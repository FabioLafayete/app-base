import 'package:app/route/pages_name.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../config/app_config.dart';
import '../modules/food/controller/food_controller.dart';
import '../modules/food/module/food_module.dart';
import '../modules/home/module/home_module.dart';
import '../modules/login/module/login_module.dart';
import '../modules/navigator/controller/nav_controller.dart';
import '../modules/onboard/module/onboard_module.dart';
import '../modules/profile/controller/profile_controller.dart';
import '../modules/profile/module/profile_module.dart';
import '../modules/workout/controller/workout_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => AppConfig.instance),
    Bind.singleton((i) => NavController()),
    Bind.singleton((i) => WorkoutController()),
  ];

  @override
  List<ModuleRoute> get routes => [
    ModuleRoute(
        PagesNames.onboard,
        module: OnboardModule(),
    ),
    ModuleRoute(
      PagesNames.login,
      module: LoginModule(),
    ),
    ModuleRoute(
      PagesNames.home,
      module: HomeModule(),
    ),
    ModuleRoute(
      PagesNames.food,
      module: FoodModule(),
    ),
    ModuleRoute(
      PagesNames.workout,
      module: LoginModule(),
    ),
    ModuleRoute(
      PagesNames.profile,
      module: ProfileModule(),
    ),
  ];
}