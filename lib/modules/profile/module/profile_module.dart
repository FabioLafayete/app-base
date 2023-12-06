import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:app/modules/navigator/page/nav_page.dart';
import 'package:app/modules/profile/page/help_page.dart';
import 'package:app/modules/profile/view/profile_data_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  void routes(r) {
    r.child(
        '/',
        child: (context) {
          Modular.get<NavController>().setSelectedIndex(4);
          return NavPage();
        }
    );
    r.child(
        '/data',
        child: (context) => ProfileDataView()
    );
    r.child(
        '/help',
        child: (context) => HelpPage()
    );
  }
}