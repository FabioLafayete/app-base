import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../navigator/page/nav_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute(
        '/',
        child: (context, args) {
          print('CHAMOU');
          print(Modular.get<NavController>().selectedIndex);
          Modular.get<NavController>().setSelectedIndex(0);
          print(Modular.get<NavController>().selectedIndex);
          return NavPage();
        }
    ),
  ];
}