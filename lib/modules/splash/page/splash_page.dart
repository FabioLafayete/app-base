import 'package:app/components/app_theme_widget.dart';
import 'package:app/config/app_config.dart';
import 'package:app/modules/home/page/home_page.dart';
import 'package:app/modules/onboard/page/onboard_page.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../components/base_page.dart';
import '../../../route/pages_name.dart';
import '../../login/page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const router = '${PagesNames.splash}/';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    AppConfig().load().then((value) async {
      await Future.delayed(const Duration(seconds: 1));
      if(AppConfig().bearerToken != null){
        Modular.to.pushReplacementNamed(HomePage.router);
      } else {
        Modular.to.pushReplacementNamed(LoginPage.router);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: false,
      padding: 0,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _background(),
          AppTheme().text(
              'Bem-vinda ao FitLab',
              fontSize: 25,
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
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                AppColors().primary,
                AppColors().secondary,
              ]
          )
      ),
    );
  }
}
