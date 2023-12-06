import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../navigator/page/nav_page.dart';

class HomeModule extends Module {
  @override
  void routes (r) {
    r.child(
        '/',
        child: (context) {
          Modular.get<NavController>().setSelectedIndex(0);
          return NavPage();
        }
    );
  }
}