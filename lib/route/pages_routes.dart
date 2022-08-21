import 'package:app/modules/login/binding/login_bindings.dart';
import 'package:app/modules/onboard/binding/onboard_bindings.dart';
import 'package:app/modules/onboard/page/onboard_page.dart';
import 'package:app/route/pages_name.dart';
import 'package:get/get.dart';
import '../modules/login/page/login_page.dart';

abstract class PagesRoutes {
  static final pages = [
    GetPage(
        name: PagesNames.login,
        page: () => LoginPage(),
        binding: LoginBindings()
    ),
    GetPage(
        name: PagesNames.onboard,
        page: () => OnboardPage(),
        binding: OnboardBinding()
    ),
  ];
}