import 'package:app/modules/login/login_bindings.dart';
import 'package:app/route/pages_name.dart';
import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_page.dart';

abstract class PagesRoutes {
  static final pages = [
    GetPage(
        name: PagesNames.home,
        page: () => HomePage(),
        binding: HomeBindings()
    ),
    GetPage(
        name: PagesNames.login,
        page: () => LoginPage(),
        binding: LoginBindings()
    ),
  ];
}