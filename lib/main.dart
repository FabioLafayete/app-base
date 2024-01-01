import 'dart:async';

import 'package:app/route/app_module.dart';
import 'package:app/route/pages_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  runZonedGuarded(() async {
    await _preload();
    runApp(
        ModularApp(
          module: AppModule(),
          child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              locale: const Locale('pt', 'BR'),
              theme: ThemeData(fontFamily: 'Inter'),
              routerConfig: Modular.routerConfig
          ),
        )
    );
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

Future _preload() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  Modular.setInitialRoute(PagesNames.splash);
}