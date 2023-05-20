import 'package:app/modules/home/controller/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../navigator/page/nav_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.factory((i) => HomeController())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
        '/',
        child: (context, args) => NavPage(index: 0)
    ),
  ];
}