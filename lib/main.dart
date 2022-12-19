import 'package:app/route/pages_name.dart';
import 'package:app/util/theme.dart';
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
        initialRoute: PagesNames.onboard,
        getPages: PagesRoutes.pages,
        locale: const Locale('pt', 'BR'),
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
      )
  );
}


Future _preload() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Get.put(AppConfig.instance);
  Get.put(Themes(), permanent: true);
  Get.put(BottomSheetController());
  Get.put(BottomSheetViewModel());
  Get.changeTheme(Themes().darkTheme);

  await Future.wait([
    AppConfig().load(),
  ]);
}