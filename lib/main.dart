import 'package:app/route/pages_name.dart';
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
        initialRoute: PagesNames.profile,
        getPages: PagesRoutes.pages,
        locale: const Locale('pt', 'BR'),
      )
  );
}


Future _preload() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  Get.put(AppConfig.instance);
  Get.put(BottomSheetController());
  Get.put(BottomSheetViewModel());

  await Future.wait([
    AppConfig().load(),
  ]);
}