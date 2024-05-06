import 'dart:async';

import 'package:app/route/app_module.dart';
import 'package:app/route/pages_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  runZonedGuarded(() async {
    await _preload();
    await SentryFlutter.init(
          (options) {
        options.dsn = 'https://66964d6975c3f568fed2902f90af86e1@o4507186383421440.ingest.us.sentry.io/4507186458460160';
        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0;
      },
      appRunner: () => runApp(ModularApp(
        module: AppModule(),
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: const Locale('pt', 'BR'),
            theme: ThemeData(fontFamily: 'Inter'),
            routerConfig: Modular.routerConfig
        ),
      )),
    );
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
    Sentry.captureException(
      error,
      stackTrace: stack,
    );
  });
}

Future _preload() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  Modular.setInitialRoute(PagesNames.splash);
}