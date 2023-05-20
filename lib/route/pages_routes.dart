import 'package:app/modules/onboard/page/onboard_page.dart';
import 'package:app/route/pages_name.dart';
import 'package:get/get.dart';
import '../modules/navigator/page/nav_page.dart';

abstract class PagesRoutes {
  static final pages = [
    GetPage(
        name: PagesNames.onboard,
        page: () => OnboardPage(),
    ),
    GetPage(
        name: PagesNames.home,
        page: () => NavPage(index: 0),
    ),
    GetPage(
        name: PagesNames.food,
        page: () => NavPage(index: 1),
    ),
    GetPage(
        name: PagesNames.workout,
        page: () => NavPage(index: 2),
    ),
    GetPage(
        name: PagesNames.profile,
        page: () => NavPage(index: 4),
    ),
  ];
}