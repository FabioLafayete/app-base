import 'package:app/modules/onboard/page/onboard_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controller/onboard_controller.dart';

class OnboardModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => OnboardController())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
        '/',
        child: (context, args) => OnboardPage()
    ),
  ];
}