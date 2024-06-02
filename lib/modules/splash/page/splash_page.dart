import 'package:app/shared/widgets/app_theme_widget.dart';
import 'package:app/config/app_config.dart';
import 'package:app/route/my_router.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/maintenance_widget.dart';
import 'package:app/util/colors.dart';
import 'package:app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/modules/user/controller/user_controller.dart';
import '../../../util/firebase_remote_config.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  late final remoteConfig = FirebaseRemoteConfigService();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future _init() async {
    // final secure = Modular.get<SecureStorageService>();
    // secure.clearAll();
    await Future.wait([
      AppConfig().load(),
      remoteConfig.init(),
    ]);
    print(remoteConfig.isMaintenance);
    if(remoteConfig.isMaintenance){
      MyRouter().pushReplacementNamed(PagesNames.maintenance);
      return;
    }
    if(AppConfig().bearerToken != null) {
      UserController controller = Modular.get<UserController>();
      await Future.delayed(const Duration(seconds: 1));
      if(controller.user.newUser){
        MyRouter().pushReplacementNamed(PagesNames.onboard);
      } else {
        MyRouter().pushReplacementNamed(PagesNames.home);
      }
    } else {
      await Future.delayed(const Duration(seconds: 1));
      MyRouter().pushReplacementNamed(PagesNames.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: false,
      paddingPage: 0,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _background(),
          AppTheme().text(
              'iBetter',
              fontSize: 35,
              fontWeight: FontWeight.w600,
              color: AppColors().background
          )
        ],
      ),
    );
  }

  Widget _background(){
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              tileMode: TileMode.repeated,
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                AppColors().secondary,
                AppColors().primary,
                AppColors().primary,
              ]
          )
      ),
    );
  }
}
