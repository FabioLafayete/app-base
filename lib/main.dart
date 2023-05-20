import 'package:app/route/app_module.dart';
import 'package:app/route/pages_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

import 'components/bottom_sheet/botto_sheet_view_model.dart';
import 'config/app_config.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _preload();
  Modular.setInitialRoute(PagesNames.login);
  runApp(
      ModularApp(
        module: AppModule(),
        child: const App(),
      )
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: const Locale('pt', 'BR'),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}



Future _preload() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  Get.put(BottomSheetController());
  Get.put(BottomSheetViewModel());

  await Future.wait([
    AppConfig().load(),
  ]);
}