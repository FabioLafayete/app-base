import 'package:app/modules/login/binding/login_bindings.dart';
import 'package:app/modules/onboard/binding/onboard_bindings.dart';
import 'package:app/modules/onboard/page/onboard_page.dart';
import 'package:app/route/pages_name.dart';
import 'package:get/get.dart';
import '../modules/login/page/login_page.dart';
import '../modules/navigator/binding/nav_bindings.dart';
import '../modules/navigator/page/nav_page.dart';

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
        binding: OnboardBindings()
    ),
    GetPage(
        name: PagesNames.home,
        page: () => NavPage(index: 0),
        binding: NavBindings()
    ),
    GetPage(
        name: PagesNames.food,
        page: () => NavPage(index: 1),
        binding: NavBindings()
    ),
    GetPage(
        name: PagesNames.workout,
        page: () => NavPage(index: 2),
        binding: NavBindings()
    ),
    GetPage(
        name: PagesNames.profile,
        page: () => NavPage(index: 4),
        binding: NavBindings()
    ),
  ];
}