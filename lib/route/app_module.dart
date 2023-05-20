import 'package:app/route/pages_name.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../config/app_config.dart';
import '../modules/food/controller/food_controller.dart';
import '../modules/home/controller/home_controller.dart';
import '../modules/login/module/login_module.dart';
import '../modules/navigator/controller/nav_controller.dart';
import '../modules/onboard/module/onboard_module.dart';
import '../modules/profile/controller/profile_controller.dart';
import '../modules/workout/controller/workout_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => AppConfig.instance),
    Bind.singleton((i) => NavController()),
    Bind.singleton((i) => HomeController()),
    Bind.singleton((i) => WorkoutController()),
    Bind.singleton((i) => FoodController()),
    Bind.singleton((i) => ProfileController()),
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
      module: LoginModule(),
    ),
    ModuleRoute(
      PagesNames.food,
      module: LoginModule(),
    ),
    ModuleRoute(
      PagesNames.workout,
      module: LoginModule(),
    ),
    ModuleRoute(
      PagesNames.profile,
      module: LoginModule(),
    ),
  ];
}