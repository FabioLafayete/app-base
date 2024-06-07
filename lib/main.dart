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
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:toastification/toastification.dart';
import 'firebase_options.dart';
import 'shared/constants/string_contants.dart';

void main() async {
  runZonedGuarded(() async {
    await _preload();
    await SentryFlutter.init(
      (options) {
        options.dsn = StringConstants.sentryUrl;
        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0;
      },
      appRunner: () => runApp(
        ModularApp(
          module: AppModule(),
          child: ToastificationWrapper(
            child: RestartWidget(
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                locale: const Locale('pt', 'BR'),
                theme: ThemeData(fontFamily: 'Inter'),
                routerConfig: Modular.routerConfig,
              ),
            ),
          ),
        ),
      ),
    );
  }, (error, stack) {
    if (kDebugMode) {
      print(error);
    }
    FirebaseCrashlytics.instance.recordError(error, stack);
    Sentry.captureException(
      error,
      stackTrace: stack,
    );
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
    AppLocal().load(),
  ]);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  Modular.setInitialRoute(PagesNames.splash);
}
