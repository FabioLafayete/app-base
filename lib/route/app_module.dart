import 'package:app/modules/splash/module/splash_module.dart';
import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/modules/workout/module/workout_module.dart';
import 'package:app/route/pages_name.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../config/app_config.dart';
import '../modules/food/controller/food_controller.dart';
import '../modules/food/module/food_module.dart';
import '../modules/home/controller/home_controller.dart';
import '../modules/home/module/home_module.dart';
import '../modules/login/module/login_module.dart';
import '../modules/navigator/controller/nav_controller.dart';
import '../modules/onboard/module/onboard_module.dart';
import '../modules/profile/controller/profile_controller.dart';
import '../modules/profile/module/profile_module.dart';
import '../service/storage/storage_service.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => SecureStorageService.instance),
    Bind.singleton((i) => AppConfig.instance),
    Bind.singleton((i) => NavController()),
    Bind.singleton((i) => HomeController()),
    Bind.singleton((i) => FoodController()),
    Bind.singleton((i) => WorkoutController()),
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
      module: HomeModule(),
    ),
    ModuleRoute(
      PagesNames.food,
      module: FoodModule(),
    ),
    ModuleRoute(
      PagesNames.workout,
      module: WorkoutModule(),
    ),
    ModuleRoute(
      PagesNames.profile,
      module: ProfileModule(),
    ),
    ModuleRoute(
      PagesNames.splash,
      module: SplashModule(),
      transition: TransitionType.noTransition
    ),
  ];
}