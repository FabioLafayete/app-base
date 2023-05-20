import 'package:app/modules/navigator/page/nav_page.dart';
import 'package:app/modules/profile/controller/profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.factory((i) => ProfileController())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
        '/',
        child: (context, args) => NavPage(index: 4)
    ),
  ];
}