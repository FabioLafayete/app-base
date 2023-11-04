import 'package:app/route/app_module.dart';
import 'package:app/route/pages_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  await _preload();
  runApp(
      ModularApp(
        module: AppModule(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: const Locale('pt', 'BR'),
          theme: ThemeData(fontFamily: 'Inter'),
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        ),
      )
  );
}

Future _preload() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  Modular.setInitialRoute(PagesNames.splash);
}