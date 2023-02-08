import 'package:app/route/pages_name.dart';
import 'package:app/util/theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'components/bottom_sheet/botto_sheet_view_model.dart';
import 'config/app_config.dart';
import 'route/pages_routes.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _preload();
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: PagesNames.nav,
        getPages: PagesRoutes.pages,
        locale: const Locale('pt', 'BR'),
        theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
        themeMode: ThemeMode.system
      )
  );
}


Future _preload() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Get.put(AppConfig.instance);
  Get.put(BottomSheetController());
  Get.put(BottomSheetViewModel());

  await Future.wait([
    AppConfig().load(),
  ]);
}