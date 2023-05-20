import 'package:app/route/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/splash/page/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _preload();
  Modular.setInitialRoute(SplashPage.router);
  runApp(
      ModularApp(
        module: AppModule(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: const Locale('pt', 'BR'),
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        ),
      )
  );
}

Future _preload() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}