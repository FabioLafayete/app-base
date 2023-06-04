import 'package:app/components/app_theme_widget.dart';
import 'package:app/config/app_config.dart';
import 'package:app/route/my_router.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import '../../../components/base_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    AppConfig().load().then((value) async {
      await Future.delayed(const Duration(seconds: 1));
      // MyRouter().pushReplacementNamed(PagesNames.profileData);
      if(AppConfig().bearerToken != null){
        MyRouter().pushReplacementNamed(PagesNames.home);
      } else {
        MyRouter().pushReplacementNamed(PagesNames.login);
      }
    });
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
              'Bem-vinda ao iBetter',
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
