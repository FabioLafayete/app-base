import 'package:app/config/app_local.dart';
import 'package:app/modules/splash/module/splash_module.dart';
import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/modules/workout/module/workout_module.dart';
import 'package:app/modules/workout/repository/impl/workout_repository_impl.dart';
import 'package:app/modules/workout/service/impl/workout_service_impl.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/modules/user/repository/impl/user_repository_impl.dart';
import 'package:app/shared/widgets/base_controller.dart';
import 'package:app/shared/widgets/maintenance_widget.dart';
import 'package:app/util/firebase_remote_config.dart';
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
import '../service/http/http_service.dart';
import '../service/storage/storage_service.dart';
import '../shared/modules/user/controller/user_controller.dart';
import '../shared/modules/user/service/impl/user_service_impl.dart';
import 'my_router.dart';

class AppModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(() => MyRouter.instance());
    i.addSingleton(() => SecureStorageService.instance);
    i.addSingleton(() => AppConfig.instance);
    i.addSingleton(() => AppLocal.instance);
    i.addSingleton(() => FirebaseRemoteConfigService.instance);
    i.addSingleton(() => NavController());
    i.addSingleton(() =>
        UserController(UserRepositoryImpl(UserServiceImpl(HttpService()))));
    i.addSingleton(() => HomeController());
    i.addSingleton(() => FoodController());
    i.addSingleton(() => WorkoutController(
      repositoryImpl: WorkoutRepositoryImpl(
        WorkoutServiceImpl(
          HttpService()
        )
      )
    ));
    i.addSingleton(() => ProfileController());
    i.addSingleton(() => BaseController());
  }

  @override
  void routes (r) {
        r.module(
          PagesNames.onboard,
          module: OnboardModule(),
        );
        r.module(
          PagesNames.login,
          module: LoginModule(),
        );
        r.module(
          PagesNames.home,
          module: HomeModule(),
        );
        r.module(
          PagesNames.food,
          module: FoodModule(),
        );
        r.module(
          PagesNames.workout,
          module: WorkoutModule(),
        );
        r.module(
          PagesNames.profile,
          module: ProfileModule(),
        );
        r.module(
            PagesNames.splash,
            module: SplashModule(),
            transition: TransitionType.noTransition
        );
        r.child(
          PagesNames.maintenance,
          child: (_) => MaintenanceWidget(),
        );
      }
}