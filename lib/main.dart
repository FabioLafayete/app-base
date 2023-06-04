import 'package:app/route/app_module.dart';
import 'package:app/route/pages_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'firebase_options.dart';

void main() async {
  await _preload();
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
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Modular.setInitialRoute(PagesNames.onboard);
}