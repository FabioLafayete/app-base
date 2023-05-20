import 'package:app/modules/food/page/food_page.dart';
import 'package:app/modules/home/page/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../navigator/page/nav_page.dart';
import '../controller/food_controller.dart';

class FoodModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.factory((i) => FoodController())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
        '/',
        child: (context, args) => NavPage(index: 1)
    ),
  ];
}