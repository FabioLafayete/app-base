import 'dart:async';

import 'package:app/config/app_local.dart';
import 'package:app/route/app_module.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/widgets/restart_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:toastification/toastification.dart';
import 'firebase_options.dart';

void main() async {
  runZonedGuarded(() async {

    await _preload();
    BuildContext? context;

    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      if (!kDebugMode) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      }
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      if (!kDebugMode) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
      return true;
    };

    runApp(ValueListenableBuilder(
      valueListenable: AppLocal().local,
      builder: (_, __, ___) {
        if(context != null){
          RestartWidget.restartApp(context!);
        }
        return ModularApp(
          module: AppModule(),
          child: ToastificationWrapper(
            child: RestartWidget(
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                locale: const Locale('pt', 'BR'),
                theme: ThemeData(fontFamily: 'Inter'),
                routerConfig: Modular.routerConfig,
                builder: (_, child){
                  context = _;
                  return child!;
                },
              ),
            ),
          ),
        );
      },
    ));

  }, (error, stack) {
    if (!kDebugMode) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return;
    }
    print(error);
  });
}

Future _preload() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerSingleton<AppLocal>(AppLocal.instance);
  await Future.wait([
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),

  ]);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  Modular.setInitialRoute(PagesNames.splash);
}


